import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../data/dashboard_catalog.dart';
import '../services/oferta_service.dart';

/// Simulador de Packs — replica de la pág 3 del index.html.
/// Selección múltiple de productos + descuento global + cálculo de márgenes.
class PacksScreen extends StatefulWidget {
  const PacksScreen({super.key});

  @override
  State<PacksScreen> createState() => _PacksScreenState();
}

class _PacksScreenState extends State<PacksScreen> {
  // Estado local del pack (independiente de la oferta global)
  final Set<String> _selectedIds = {};
  final Map<String, int> _qty = {};
  double _discount = 5;
  int _iva = 21;
  String _search = '';
  String _categoryFilter = 'all';

  // ───────────────────────────────────────────────────────────────────────
  List<DashboardProduct> get _selectedProducts =>
      _selectedIds.map((id) => DashboardCatalog.byId(id)).whereType<DashboardProduct>().toList();

  double get _coste => _selectedProducts.fold(0.0, (s, p) => s + p.coste * (_qty[p.id] ?? 1));
  double get _pvd   => _selectedProducts.fold(0.0, (s, p) => s + p.pvd   * (_qty[p.id] ?? 1));
  double get _pvpBase => _selectedProducts.fold(0.0, (s, p) => s + p.pvp * (_qty[p.id] ?? 1));
  double get _pvpNet  => _pvpBase * (1 - _discount / 100);
  double get _pvpIva  => _pvpNet * (1 + _iva / 100);
  double get _descEur => _pvpBase - _pvpNet;
  double get _marginCoste => _pvpNet - _coste;
  double get _marginCostePct => _coste == 0 ? 0 : (_marginCoste / _coste) * 100;
  double get _marginPvd => _pvpNet - _pvd;
  double get _marginPvdPct => _pvd == 0 ? 0 : (_marginPvd / _pvd) * 100;

  void _toggle(String id) {
    HapticFeedback.selectionClick();
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        _qty.remove(id);
      } else {
        _selectedIds.add(id);
        _qty[id] = 1;
      }
    });
  }

  void _setQty(String id, int q) {
    if (q <= 0) {
      setState(() {
        _selectedIds.remove(id);
        _qty.remove(id);
      });
    } else {
      setState(() => _qty[id] = q);
    }
  }

  void _clear() {
    HapticFeedback.mediumImpact();
    setState(() {
      _selectedIds.clear();
      _qty.clear();
    });
  }

  void _addToOferta() {
    HapticFeedback.heavyImpact();
    final svc = context.read<OfertaService>();
    for (final p in _selectedProducts) {
      svc.add(p, qty: _qty[p.id] ?? 1);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_selectedProducts.length} productos añadidos a la oferta'),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final filtered = DashboardCatalog.products.where((p) {
      if (_categoryFilter != 'all' && p.cat != _categoryFilter) return false;
      if (_search.isNotEmpty) {
        final q = _search.toLowerCase();
        if (!p.name.toLowerCase().contains(q) && !p.sub.toLowerCase().contains(q)) return false;
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Simulador de Packs'),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        foregroundColor: AppTheme.textPrimary,
        titleTextStyle: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        actions: [
          if (_selectedIds.isNotEmpty)
            TextButton.icon(
              onPressed: _clear,
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              label: const Text('Limpiar'),
              style: TextButton.styleFrom(foregroundColor: const Color(0xFFEF4444)),
            ),
        ],
      ),
      body: Column(
        children: [
          // ── Resumen sticky arriba ─────────────────────────────────
          if (_selectedIds.isNotEmpty) _summaryHeader(),

          // ── Buscador + filtro ─────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
            child: TextField(
              onChanged: (v) => setState(() => _search = v),
              decoration: InputDecoration(
                hintText: 'Filtrar productos…',
                prefixIcon: const Icon(Icons.search_rounded, size: 20),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                filled: true,
                fillColor: AppTheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppTheme.divider.withValues(alpha: 0.6)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppTheme.divider.withValues(alpha: 0.6)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              children: [
                _CatChip(
                    label: 'Todo',
                    icon: '🔍',
                    selected: _categoryFilter == 'all',
                    onTap: () => setState(() => _categoryFilter = 'all')),
                for (final c in DashboardCatalog.categories)
                  _CatChip(
                    label: c.label,
                    icon: c.icon,
                    color: c.color,
                    selected: _categoryFilter == c.id,
                    onTap: () => setState(() => _categoryFilter = c.id),
                  ),
              ],
            ),
          ),

          // ── Lista productos ────────────────────────────────────────
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final p = filtered[i];
                final selected = _selectedIds.contains(p.id);
                final cat = DashboardCatalog.catOf(p.cat);
                return _PackProductRow(
                  product: p,
                  category: cat,
                  selected: selected,
                  qty: _qty[p.id] ?? 1,
                  onToggle: () => _toggle(p.id),
                  onQtyChange: (q) => _setQty(p.id, q),
                );
              },
            ),
          ),
        ],
      ),

      // ── Botón flotante: ir a totales / añadir a oferta ────────────
      bottomNavigationBar: _selectedIds.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _showTotalsSheet(context),
                        icon: const Icon(Icons.assessment_rounded, size: 20),
                        label: Text('Ver totales · ${_selectedIds.length} ítems'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: _addToOferta,
                        icon: const Icon(Icons.send_rounded, color: Colors.white),
                        tooltip: 'Añadir a Oferta',
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // ────────────────────────────────────────────────────────────
  Widget _summaryHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0066FF), Color(0xFF0D3B73)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppTheme.elevatedShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('${_selectedIds.length} ítems',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Pack actual',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Text(
                _e(_pvpNet),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              _MiniStat(label: 'Coste', value: _e(_coste), color: Colors.red.shade200),
              const SizedBox(width: 8),
              _MiniStat(
                  label: 'Margen',
                  value: '${_marginCostePct.toStringAsFixed(0)}%',
                  color: Colors.greenAccent),
              const SizedBox(width: 8),
              _MiniStat(label: 'Dto.', value: '${_discount.toStringAsFixed(0)}%', color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }

  void _showTotalsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSt) => DraggableScrollableSheet(
          initialChildSize: 0.85,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (_, ctrl) => Container(
            decoration: const BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: ListView(
              controller: ctrl,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              children: [
                Center(
                  child: Container(
                    width: 44,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppTheme.divider,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text('Resumen del pack',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                      letterSpacing: -0.4,
                    )),
                const SizedBox(height: 18),

                // Líneas
                ..._selectedProducts.map((p) {
                  final q = _qty[p.id] ?? 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('×$q',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.primary,
                              )),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            p.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        Text(_e(p.pvp * q),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textPrimary,
                            )),
                      ],
                    ),
                  );
                }),

                const Divider(height: 24),

                // Sliders descuento + IVA
                Row(
                  children: [
                    const Text('Dto. pack',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textSecondary,
                        )),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppTheme.primary,
                          thumbColor: AppTheme.primary,
                          overlayColor: AppTheme.primary.withValues(alpha: 0.2),
                          inactiveTrackColor: AppTheme.divider,
                          valueIndicatorColor: AppTheme.primary,
                        ),
                        child: Slider(
                          value: _discount,
                          min: 0,
                          max: 25,
                          divisions: 25,
                          label: '${_discount.toStringAsFixed(0)}%',
                          onChanged: (v) {
                            setSt(() {});
                            setState(() => _discount = v);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text('${_discount.toStringAsFixed(0)}%',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primary)),
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Text('IVA',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textSecondary,
                        )),
                    const SizedBox(width: 10),
                    Wrap(
                      spacing: 6,
                      children: [0, 4, 10, 21]
                          .map((iva) => ChoiceChip(
                                label: Text('$iva%'),
                                selected: _iva == iva,
                                onSelected: (s) {
                                  setSt(() {});
                                  setState(() => _iva = iva);
                                },
                                selectedColor: AppTheme.primary,
                                labelStyle: TextStyle(
                                    color: _iva == iva
                                        ? Colors.white
                                        : AppTheme.textPrimary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                              ))
                          .toList(),
                    ),
                  ],
                ),

                const Divider(height: 24),

                _SumRow(label: 'PVP recomendado', value: _e(_pvpBase)),
                _SumRow(label: 'Descuento aplicado', value: '−${_e(_descEur)}', neg: true),
                _SumRow(label: 'PVP pack (sin IVA)', value: _e(_pvpNet), bold: true),
                _SumRow(
                    label: 'PVP pack (con IVA $_iva%)',
                    value: _e(_pvpIva),
                    primary: true,
                    bold: true,
                    big: true),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: _BigStat(
                          label: 'Coste total',
                          value: _e(_coste),
                          color: const Color(0xFFEF4444)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _BigStat(
                          label: 'PVD total',
                          value: _e(_pvd),
                          color: const Color(0xFF8B5CF6)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _BigStat(
                          label: 'Margen / coste',
                          value: _e(_marginCoste),
                          sub: '${_marginCostePct.toStringAsFixed(0)}%',
                          color: const Color(0xFF10B981)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _BigStat(
                          label: 'Margen PVD→PVP',
                          value: _e(_marginPvd),
                          sub: '${_marginPvdPct.toStringAsFixed(0)}%',
                          color: AppTheme.primary),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _addToOferta();
                  },
                  icon: const Icon(Icons.add_to_photos_rounded),
                  label: const Text('Añadir pack a la Oferta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String _e(double v) {
    final s = v.toStringAsFixed(0);
    return s.replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (m) => '${m[1]}.') +
        ' €';
  }
}

// ════════════════════════════════════════════════════════════════
// WIDGETS
// ════════════════════════════════════════════════════════════════

class _PackProductRow extends StatelessWidget {
  final DashboardProduct product;
  final DashboardCategory category;
  final bool selected;
  final int qty;
  final VoidCallback onToggle;
  final ValueChanged<int> onQtyChange;
  const _PackProductRow({
    required this.product,
    required this.category,
    required this.selected,
    required this.qty,
    required this.onToggle,
    required this.onQtyChange,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primary.withValues(alpha: 0.06)
              : AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppTheme.primary : AppTheme.divider,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Checkbox visual
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: selected ? AppTheme.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: selected ? AppTheme.primary : AppTheme.textHint,
                  width: 2,
                ),
              ),
              child: selected
                  ? const Icon(Icons.check_rounded, size: 14, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 10),

            // Imagen
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: product.hasImage
                  ? Image.asset(product.asset!, fit: BoxFit.contain)
                  : Center(
                      child: Text(category.icon,
                          style: const TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 10),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(product.sub,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textSecondary,
                          )),
                      const SizedBox(width: 8),
                      Text(_e(product.pvp),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.primary,
                          )),
                    ],
                  ),
                ],
              ),
            ),

            // Selector cantidad (sólo si seleccionado)
            if (selected)
              Row(
                children: [
                  IconButton(
                    onPressed: () => onQtyChange(qty - 1),
                    icon: const Icon(Icons.remove_circle_outline_rounded,
                        size: 22),
                    color: AppTheme.textSecondary,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text('$qty',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.primary)),
                  ),
                  IconButton(
                    onPressed: () => onQtyChange(qty + 1),
                    icon: const Icon(Icons.add_circle_rounded, size: 22),
                    color: AppTheme.primary,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  static String _e(double v) {
    final s = v.toStringAsFixed(0);
    return s.replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (m) => '${m[1]}.') +
        ' €';
  }
}

class _CatChip extends StatelessWidget {
  final String label, icon;
  final Color? color;
  final bool selected;
  final VoidCallback onTap;
  const _CatChip(
      {required this.label,
      required this.icon,
      required this.selected,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppTheme.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: selected ? c : AppTheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: selected ? c : AppTheme.divider),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(icon, style: const TextStyle(fontSize: 13)),
              const SizedBox(width: 5),
              Text(label,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: selected ? Colors.white : AppTheme.textPrimary,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label, value;
  final Color color;
  const _MiniStat({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.13),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(label,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.white.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                )),
            const SizedBox(height: 2),
            Text(value,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.2,
                )),
          ],
        ),
      ),
    );
  }
}

class _SumRow extends StatelessWidget {
  final String label, value;
  final bool bold, big, primary, neg;
  const _SumRow({
    required this.label,
    required this.value,
    this.bold = false,
    this.big = false,
    this.primary = false,
    this.neg = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                  fontSize: big ? 13 : 12,
                  color: AppTheme.textSecondary,
                  fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
                )),
          ),
          Text(value,
              style: TextStyle(
                fontSize: big ? 18 : 13,
                color: primary
                    ? AppTheme.primary
                    : neg
                        ? const Color(0xFFEF4444)
                        : AppTheme.textPrimary,
                fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
                letterSpacing: -0.3,
              )),
        ],
      ),
    );
  }
}

class _BigStat extends StatelessWidget {
  final String label, value;
  final String? sub;
  final Color color;
  const _BigStat({
    required this.label,
    required this.value,
    required this.color,
    this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: 0.3,
              )),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
                letterSpacing: -0.4,
              )),
          if (sub != null) ...[
            const SizedBox(height: 2),
            Text(sub!,
                style: TextStyle(
                  fontSize: 11,
                  color: color,
                  fontWeight: FontWeight.w800,
                )),
          ],
        ],
      ),
    );
  }
}
