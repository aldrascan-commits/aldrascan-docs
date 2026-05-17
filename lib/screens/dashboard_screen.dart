import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../data/dashboard_catalog.dart';

/// Dashboard Pro — Catálogo completo extraído desde el index.html
/// 117 productos, 22 marcas, 10 categorías, filtros, búsqueda y KPIs.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedCat = 'all';
  String? _selectedBrand;
  String _search = '';
  bool _onlyWithImage = false;

  // ────────────────────────────────────────────────────────────────────────
  List<DashboardProduct> get _filtered {
    var list = DashboardCatalog.products.where((p) {
      if (_selectedCat != 'all' && p.cat != _selectedCat) return false;
      if (_selectedBrand != null && p.sub != _selectedBrand) return false;
      if (_onlyWithImage && !p.hasImage) return false;
      if (_search.isNotEmpty) {
        final q = _search.toLowerCase();
        if (!p.name.toLowerCase().contains(q) &&
            !p.sub.toLowerCase().contains(q) &&
            !p.id.toLowerCase().contains(q)) {
          return false;
        }
      }
      return true;
    }).toList();
    list.sort((a, b) => b.pvp.compareTo(a.pvp));
    return list;
  }

  double get _totalCatalogValue =>
      DashboardCatalog.products.fold(0.0, (s, p) => s + p.pvp);
  double get _avgMargin {
    final productsWithCost =
        DashboardCatalog.products.where((p) => p.coste > 0).toList();
    if (productsWithCost.isEmpty) return 0;
    return productsWithCost
            .map((p) => p.margenPvp)
            .reduce((a, b) => a + b) /
        productsWithCost.length;
  }

  // ────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          // ── Header ──────────────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: AppTheme.primary,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
              title: const Text(
                'Dashboard Pro',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0066FF), Color(0xFF0D3B73)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.bolt_rounded,
                                      size: 14, color: Colors.amber),
                                  SizedBox(width: 4),
                                  Text('AldraScan · Pro',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      )),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${DashboardCatalog.products.length} SKUs',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Catálogo completo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${DashboardCatalog.brands.length} marcas · '
                          '${DashboardCatalog.categories.length} categorías · '
                          'Margen medio ${_avgMargin.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── KPIs ────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  _KpiCard(
                    label: 'Valor total',
                    value: _formatEuro(_totalCatalogValue),
                    icon: Icons.euro_rounded,
                    color: AppTheme.primary,
                  ),
                  const SizedBox(width: 10),
                  _KpiCard(
                    label: 'Margen medio',
                    value: '${_avgMargin.toStringAsFixed(0)}%',
                    icon: Icons.trending_up_rounded,
                    color: const Color(0xFF10B981),
                  ),
                  const SizedBox(width: 10),
                  _KpiCard(
                    label: 'Mostrados',
                    value: '${filtered.length}',
                    icon: Icons.inventory_2_rounded,
                    color: AppTheme.accentWarm,
                  ),
                ],
              ),
            ),
          ),

          // ── Buscador ────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: TextField(
                onChanged: (v) => setState(() => _search = v),
                decoration: InputDecoration(
                  hintText: 'Buscar por nombre, marca o ID…',
                  prefixIcon: const Icon(Icons.search_rounded, size: 22),
                  filled: true,
                  fillColor: AppTheme.surface,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: AppTheme.divider.withValues(alpha: 0.6),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: AppTheme.divider.withValues(alpha: 0.6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:
                        const BorderSide(color: AppTheme.primary, width: 1.6),
                  ),
                ),
              ),
            ),
          ),

          // ── Filtro categorías ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                children: [
                  _CategoryChip(
                    label: 'Todo',
                    icon: '🔍',
                    selected: _selectedCat == 'all',
                    onTap: () => setState(() => _selectedCat = 'all'),
                  ),
                  for (final c in DashboardCatalog.categories)
                    _CategoryChip(
                      label: c.label,
                      icon: c.icon,
                      color: c.color,
                      selected: _selectedCat == c.id,
                      onTap: () => setState(() => _selectedCat = c.id),
                    ),
                ],
              ),
            ),
          ),

          // ── Filtros marca + imagen ─────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: _BrandDropdown(
                      selected: _selectedBrand,
                      onChanged: (v) => setState(() => _selectedBrand = v),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(
                        () => _onlyWithImage = !_onlyWithImage),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: _onlyWithImage
                            ? AppTheme.primary
                            : AppTheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _onlyWithImage
                              ? AppTheme.primary
                              : AppTheme.divider,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _onlyWithImage
                                ? Icons.image_rounded
                                : Icons.image_outlined,
                            size: 18,
                            color: _onlyWithImage
                                ? Colors.white
                                : AppTheme.textSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Con foto',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _onlyWithImage
                                  ? Colors.white
                                  : AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Lista de productos ──────────────────────────────────────────
          if (filtered.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search_off_rounded,
                          size: 64, color: AppTheme.textHint),
                      SizedBox(height: 12),
                      Text('Sin resultados',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textSecondary,
                          )),
                      SizedBox(height: 4),
                      Text('Ajusta filtros o búsqueda',
                          style: TextStyle(color: AppTheme.textHint)),
                    ],
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              sliver: SliverList.separated(
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) => _ProductRow(p: filtered[i]),
              ),
            ),
        ],
      ),
    );
  }

  static String _formatEuro(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M €';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(0)}K €';
    return '${v.toStringAsFixed(0)} €';
  }
}

// ═════════════════════════════════════════════════════════════════════════
// WIDGETS
// ═════════════════════════════════════════════════════════════════════════

class _KpiCard extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _KpiCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 16, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label, icon;
  final Color? color;
  final bool selected;
  final VoidCallback onTap;
  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppTheme.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? c : AppTheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? c : AppTheme.divider,
              width: 1,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: c.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(icon, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandDropdown extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onChanged;
  const _BrandDropdown({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.divider),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: selected,
          isExpanded: true,
          icon: const Icon(Icons.expand_more_rounded, size: 20),
          hint: const Text('Filtrar por marca',
              style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w500)),
          items: [
            const DropdownMenuItem<String?>(
              value: null,
              child: Text('Todas las marcas',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            for (final b in DashboardCatalog.brands)
              DropdownMenuItem<String?>(
                value: b,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: DashboardCatalog.brandColors[b] ??
                            AppTheme.textHint,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(b,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final DashboardProduct p;
  const _ProductRow({required this.p});

  @override
  Widget build(BuildContext context) {
    final cat = DashboardCatalog.catOf(p.cat);
    final brandColor =
        DashboardCatalog.brandColors[p.sub] ?? AppTheme.textHint;
    final margin = p.margenPvp;

    return InkWell(
      onTap: () => _showDetail(context, p),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          boxShadow: AppTheme.cardShadow,
          border: Border.all(color: AppTheme.divider, width: 1),
        ),
        child: Row(
          children: [
            // ── Image / Placeholder ─────────────────────────────────────
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: cat.color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: p.hasImage
                  ? Image.asset(
                      p.asset!,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => _placeholder(cat),
                    )
                  : _placeholder(cat),
            ),
            const SizedBox(width: 12),

            // ── Info ────────────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _Tag(text: p.sub, color: brandColor),
                      const SizedBox(width: 6),
                      _Tag(text: cat.label, color: cat.color, light: true),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    p.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      letterSpacing: -0.2,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        _euro(p.pvp),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (margin > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: _marginColor(margin).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${margin.toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              color: _marginColor(margin),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppTheme.textHint, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _placeholder(DashboardCategory cat) => Center(
        child: Text(cat.icon, style: const TextStyle(fontSize: 28)),
      );

  static Color _marginColor(double m) {
    if (m >= 50) return const Color(0xFF10B981);
    if (m >= 25) return AppTheme.primary;
    if (m >= 10) return const Color(0xFFF59E0B);
    return const Color(0xFFEF4444);
  }

  static String _euro(double v) {
    final s = v.toStringAsFixed(0);
    final r = s.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '$r €';
  }

  void _showDetail(BuildContext context, DashboardProduct p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ProductDetailSheet(p: p),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color color;
  final bool light;
  const _Tag({required this.text, required this.color, this.light = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: light ? color.withValues(alpha: 0.12) : color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9.5,
          fontWeight: FontWeight.w800,
          color: light ? color : Colors.white,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// BOTTOM SHEET DETALLE
// ═════════════════════════════════════════════════════════════════════════
class _ProductDetailSheet extends StatelessWidget {
  final DashboardProduct p;
  const _ProductDetailSheet({required this.p});

  @override
  Widget build(BuildContext context) {
    final cat = DashboardCatalog.catOf(p.cat);
    final brandColor =
        DashboardCatalog.brandColors[p.sub] ?? AppTheme.textHint;

    return DraggableScrollableSheet(
      initialChildSize: 0.78,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, ctrl) => Container(
        decoration: const BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: ListView(
          controller: ctrl,
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 10),
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

            // Hero image
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 220,
              decoration: BoxDecoration(
                color: cat.color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: p.hasImage
                  ? Image.asset(p.asset!, fit: BoxFit.contain)
                  : Center(
                      child:
                          Text(cat.icon, style: const TextStyle(fontSize: 80)),
                    ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _Tag(text: p.sub, color: brandColor),
                      const SizedBox(width: 6),
                      _Tag(text: cat.label, color: cat.color, light: true),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    p.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                      letterSpacing: -0.5,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'ID: ${p.id}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppTheme.textHint,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Precios
                  Row(
                    children: [
                      Expanded(
                        child: _PriceCard(
                          label: 'Coste',
                          value: p.coste,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _PriceCard(
                          label: 'PVD',
                          value: p.pvd,
                          color: AppTheme.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _PriceCard(
                          label: 'PVP',
                          value: p.pvp,
                          color: const Color(0xFF10B981),
                          highlight: true,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Margenes
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF10B981).withValues(alpha: 0.10),
                          AppTheme.primary.withValues(alpha: 0.06),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: const Color(0xFF10B981)
                              .withValues(alpha: 0.18)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Márgenes sobre coste',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textSecondary,
                              letterSpacing: 0.4,
                            )),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _MarginPill(
                                label: 'PVD',
                                pct: p.margenPvd,
                                color: AppTheme.primary),
                            const SizedBox(width: 10),
                            _MarginPill(
                                label: 'PVP',
                                pct: p.margenPvp,
                                color: const Color(0xFF10B981)),
                            const Spacer(),
                            Text(
                              'Beneficio: ${_fmtEuro(p.pvp - p.coste)}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _fmtEuro(double v) {
    final s = v.toStringAsFixed(0);
    final r = s.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '$r €';
  }
}

class _PriceCard extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final bool highlight;
  const _PriceCard({
    required this.label,
    required this.value,
    required this.color,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: highlight ? color.withValues(alpha: 0.12) : AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: highlight ? color.withValues(alpha: 0.3) : AppTheme.divider,
          width: highlight ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
                letterSpacing: 0.5,
              )),
          const SizedBox(height: 4),
          Text(
            _fmt(value),
            style: TextStyle(
              fontSize: highlight ? 17 : 15,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  static String _fmt(double v) {
    final s = v.toStringAsFixed(0);
    final r = s.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '$r €';
  }
}

class _MarginPill extends StatelessWidget {
  final String label;
  final double pct;
  final Color color;
  const _MarginPill(
      {required this.label, required this.pct, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: 0.3,
              )),
          const SizedBox(width: 4),
          Text(
            '+${pct.toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
