import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../data/dashboard_catalog.dart';

/// Calculadora de margen interno — replica de la pág 4 del index.html
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  /// Modo: 'venta' = a partir de coste+precio venta, 'margen' = a partir de coste+margen objetivo
  String _mode = 'venta';

  // Modo "Simular venta"
  final _costeCtrl   = TextEditingController(text: '6250');
  final _precioCtrl  = TextEditingController(text: '8850');
  final _dtoCtrl     = TextEditingController(text: '0');
  int _iva = 21;

  // Modo "Desde margen"
  final _mCosteCtrl  = TextEditingController(text: '6250');
  final _mMargenCtrl = TextEditingController(text: '30');
  final _mDtoCtrl    = TextEditingController(text: '5');
  int _mIva = 21;

  String _refSearch = '';

  // ── Cálculos modo VENTA ────────────────────────────────────────────
  double get _coste  => double.tryParse(_costeCtrl.text)  ?? 0;
  double get _precio => double.tryParse(_precioCtrl.text) ?? 0;
  double get _dto    => double.tryParse(_dtoCtrl.text)    ?? 0;

  double get _precioConDto    => _precio * (1 - _dto / 100);
  double get _beneficio       => _precioConDto - _coste;
  double get _margenPct       =>
      _precioConDto == 0 ? 0 : (_beneficio / _precioConDto) * 100;
  double get _markupPct       =>
      _coste == 0 ? 0 : (_beneficio / _coste) * 100;
  double get _precioFinalIva  => _precioConDto * (1 + _iva / 100);

  // ── Cálculos modo MARGEN ───────────────────────────────────────────
  double get _mCoste  => double.tryParse(_mCosteCtrl.text)  ?? 0;
  double get _mMargen => double.tryParse(_mMargenCtrl.text) ?? 0;
  double get _mDto    => double.tryParse(_mDtoCtrl.text)    ?? 0;

  double get _mPrecio => _mMargen >= 100 ? 0 : _mCoste / (1 - _mMargen / 100);
  double get _mPrecioIva    => _mPrecio * (1 + _mIva / 100);
  double get _mBeneficio    => _mPrecio - _mCoste;
  double get _mPrecioMinDto => _mPrecio * (1 - _mDto / 100);

  // ────────────────────────────────────────────────────────────────────
  @override
  void dispose() {
    _costeCtrl.dispose();
    _precioCtrl.dispose();
    _dtoCtrl.dispose();
    _mCosteCtrl.dispose();
    _mMargenCtrl.dispose();
    _mDtoCtrl.dispose();
    super.dispose();
  }

  void _loadFromProduct(DashboardProduct p) {
    HapticFeedback.lightImpact();
    setState(() {
      _costeCtrl.text  = p.coste.toStringAsFixed(0);
      _precioCtrl.text = p.pvp.toStringAsFixed(0);
      _mCosteCtrl.text = p.coste.toStringAsFixed(0);
    });
  }

  // ────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final filteredRefs = DashboardCatalog.products
        .where((p) =>
            p.coste > 0 &&
            (_refSearch.isEmpty ||
                p.name.toLowerCase().contains(_refSearch.toLowerCase()) ||
                p.sub.toLowerCase().contains(_refSearch.toLowerCase())))
        .toList()
      ..sort((a, b) => b.pvp.compareTo(a.pvp));

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        foregroundColor: AppTheme.textPrimary,
        titleTextStyle: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          // ── Header ──────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0066FF), Color(0xFF0D3B73)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: AppTheme.elevatedShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.calculate_rounded, color: Colors.amber, size: 22),
                    SizedBox(width: 8),
                    Text('Calculadora de margen',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _mode == 'venta'
                      ? 'Introduce coste y precio, calcula tu margen real'
                      : 'Define el margen objetivo y calculamos el precio',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // ── Toggle modo ─────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _ModeBtn(
                  label: '💰 Simular venta',
                  selected: _mode == 'venta',
                  onTap: () => setState(() => _mode = 'venta'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ModeBtn(
                  label: '🎯 Desde margen',
                  selected: _mode == 'margen',
                  onTap: () => setState(() => _mode = 'margen'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // ── Paneles ─────────────────────────────────────────────
          if (_mode == 'venta') _panelVenta() else _panelMargen(),

          const SizedBox(height: 20),

          // ── Referencia rápida ───────────────────────────────────
          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.flash_on_rounded,
                        size: 18, color: AppTheme.accentWarm),
                    const SizedBox(width: 6),
                    const Text('Referencia rápida',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textPrimary,
                        )),
                    const Spacer(),
                    Text('${filteredRefs.length} productos',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppTheme.textHint,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (v) => setState(() => _refSearch = v),
                  decoration: InputDecoration(
                    hintText: 'Filtrar…',
                    prefixIcon: const Icon(Icons.search, size: 18),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppTheme.divider.withValues(alpha: 0.6)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 240,
                  child: ListView.separated(
                    itemCount: filteredRefs.length,
                    separatorBuilder: (_, __) => const Divider(
                        height: 8, thickness: 0.4, color: AppTheme.divider),
                    itemBuilder: (_, i) {
                      final p = filteredRefs[i];
                      return InkWell(
                        onTap: () => _loadFromProduct(p),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      p.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${p.sub} · Coste ${_e(p.coste)} · PVP ${_e(p.pvp)}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.add_circle_outline_rounded,
                                  size: 20, color: AppTheme.primary),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════════
  // PANEL VENTA
  // ════════════════════════════════════════════════════════════════════
  Widget _panelVenta() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Datos de la operación',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
                letterSpacing: 0.4,
              )),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _NumField(label: 'Coste', suffix: '€', ctrl: _costeCtrl, onChanged: (_)=>setState((){}))),
            const SizedBox(width: 10),
            Expanded(child: _NumField(label: 'Precio venta', suffix: '€', ctrl: _precioCtrl, onChanged: (_)=>setState((){}))),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _IvaSelect(value: _iva, onChanged: (v)=>setState(()=>_iva=v))),
            const SizedBox(width: 10),
            Expanded(child: _NumField(label: 'Descuento cliente', suffix: '%', ctrl: _dtoCtrl, onChanged: (_)=>setState((){}))),
          ]),
          const Divider(height: 28),
          const Text('Tu rentabilidad',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
                letterSpacing: 0.4,
              )),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.55,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _MetricBox(
                label: 'Margen / venta',
                value: '${_margenPct.toStringAsFixed(1)}%',
                sub: 'sobre precio venta',
                color: const Color(0xFF10B981),
                highlight: true,
              ),
              _MetricBox(
                label: 'Beneficio',
                value: _e(_beneficio),
                sub: 'sin IVA',
                color: AppTheme.primary,
              ),
              _MetricBox(
                label: 'Final cliente',
                value: _e(_precioFinalIva),
                sub: 'IVA $_iva% incl.',
                color: const Color(0xFF8B5CF6),
              ),
              _MetricBox(
                label: 'Markup',
                value: '${_markupPct.toStringAsFixed(0)}%',
                sub: 'sobre coste',
                color: AppTheme.accentWarm,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _StructureBar(coste: _coste, beneficio: _beneficio),
          const SizedBox(height: 14),
          _Tip(margen: _margenPct),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════════
  // PANEL MARGEN
  // ════════════════════════════════════════════════════════════════════
  Widget _panelMargen() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Precio desde margen objetivo',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
                letterSpacing: 0.4,
              )),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _NumField(label: 'Coste', suffix: '€', ctrl: _mCosteCtrl, onChanged: (_)=>setState((){}))),
            const SizedBox(width: 10),
            Expanded(child: _NumField(label: 'Margen objetivo', suffix: '%', ctrl: _mMargenCtrl, onChanged: (_)=>setState((){}))),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _IvaSelect(value: _mIva, onChanged: (v)=>setState(()=>_mIva=v))),
            const SizedBox(width: 10),
            Expanded(child: _NumField(label: 'Dto. máx. cliente', suffix: '%', ctrl: _mDtoCtrl, onChanged: (_)=>setState((){}))),
          ]),
          const Divider(height: 28),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.55,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _MetricBox(
                label: 'Precio recomendado',
                value: _e(_mPrecio),
                sub: 'sin IVA',
                color: AppTheme.primary,
                highlight: true,
              ),
              _MetricBox(
                label: 'Precio con IVA',
                value: _e(_mPrecioIva),
                sub: 'IVA $_mIva%',
                color: const Color(0xFF8B5CF6),
              ),
              _MetricBox(
                label: 'Tu beneficio',
                value: _e(_mBeneficio),
                sub: 'por operación',
                color: const Color(0xFF10B981),
              ),
              _MetricBox(
                label: 'Precio mín. con dto.',
                value: _e(_mPrecioMinDto),
                sub: 'margen residual',
                color: AppTheme.accentWarm,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── helpers ─────────────────────────────────────────────────
  static String _e(double v) {
    final s = v.toStringAsFixed(0);
    return s.replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (m) => '${m[1]}.') +
        ' €';
  }
}

// ════════════════════════════════════════════════════════════════════
// WIDGETS DE APOYO
// ════════════════════════════════════════════════════════════════════

class _ModeBtn extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ModeBtn(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primary : AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: selected ? AppTheme.primary : AppTheme.divider, width: 1),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : AppTheme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
        border: Border.all(color: AppTheme.divider, width: 1),
      ),
      child: child,
    );
  }
}

class _NumField extends StatelessWidget {
  final String label, suffix;
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;
  const _NumField(
      {required this.label,
      required this.suffix,
      required this.ctrl,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
                letterSpacing: 0.3)),
        const SizedBox(height: 4),
        TextField(
          controller: ctrl,
          onChanged: onChanged,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
          ],
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            suffixText: suffix,
            suffixStyle: const TextStyle(
              fontSize: 12,
              color: AppTheme.textHint,
              fontWeight: FontWeight.w700,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppTheme.divider.withValues(alpha: 0.6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppTheme.primary, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class _IvaSelect extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;
  const _IvaSelect({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('IVA',
            style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
                letterSpacing: 0.3)),
        const SizedBox(height: 4),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.divider.withValues(alpha: 0.6)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.expand_more_rounded, size: 18),
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary),
              items: const [
                DropdownMenuItem(value: 0, child: Text('0 %')),
                DropdownMenuItem(value: 4, child: Text('4 %')),
                DropdownMenuItem(value: 10, child: Text('10 %')),
                DropdownMenuItem(value: 21, child: Text('21 %')),
              ],
              onChanged: (v) {
                if (v != null) onChanged(v);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String label, value, sub;
  final Color color;
  final bool highlight;
  const _MetricBox(
      {required this.label,
      required this.value,
      required this.sub,
      required this.color,
      this.highlight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: highlight
            ? LinearGradient(
                colors: [
                  color.withValues(alpha: 0.16),
                  color.withValues(alpha: 0.06),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: highlight ? null : color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: color.withValues(alpha: highlight ? 0.35 : 0.15),
            width: highlight ? 1.4 : 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: 0.3,
              )),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                fontSize: highlight ? 22 : 18,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
                letterSpacing: -0.4,
                height: 1.05,
              )),
          const SizedBox(height: 2),
          Text(sub,
              style: const TextStyle(
                fontSize: 9.5,
                color: AppTheme.textHint,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

class _StructureBar extends StatelessWidget {
  final double coste, beneficio;
  const _StructureBar({required this.coste, required this.beneficio});

  @override
  Widget build(BuildContext context) {
    final total = coste + (beneficio > 0 ? beneficio : 0);
    final cPct = total == 0 ? 0.5 : coste / total;
    final mPct = 1 - cPct;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estructura del precio',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.textSecondary,
              letterSpacing: 0.3,
            )),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 12,
            child: Row(children: [
              Flexible(
                  flex: (cPct * 1000).round().clamp(1, 999),
                  child: Container(color: const Color(0xFFEF4444))),
              Flexible(
                  flex: (mPct * 1000).round().clamp(1, 999),
                  child: Container(color: const Color(0xFF10B981))),
            ]),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const _LegendDot(color: Color(0xFFEF4444), label: 'Tu coste'),
            const SizedBox(width: 14),
            const _LegendDot(color: Color(0xFF10B981), label: 'Tu margen'),
            const Spacer(),
            Text(
              '${(cPct * 100).toStringAsFixed(0)}% / ${(mPct * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 11,
                color: AppTheme.textHint,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label,
            style: const TextStyle(
              fontSize: 11,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

class _Tip extends StatelessWidget {
  final double margen;
  const _Tip({required this.margen});

  @override
  Widget build(BuildContext context) {
    String text;
    IconData icon;
    Color color;
    if (margen >= 40) {
      text = 'Margen excelente. Estás vendiendo con buena rentabilidad. 🚀';
      icon = Icons.rocket_launch_rounded;
      color = const Color(0xFF10B981);
    } else if (margen >= 25) {
      text = 'Margen saludable. Tienes recorrido para descuentos sin perder.';
      icon = Icons.thumb_up_rounded;
      color = AppTheme.primary;
    } else if (margen >= 10) {
      text = 'Margen ajustado. Cuidado con descuentos adicionales al cliente.';
      icon = Icons.warning_amber_rounded;
      color = const Color(0xFFF59E0B);
    } else if (margen > 0) {
      text = 'Margen muy bajo. Revisa coste o sube precio antes de cerrar.';
      icon = Icons.priority_high_rounded;
      color = const Color(0xFFEF4444);
    } else {
      text = 'Estás vendiendo a pérdida. Revisa los datos. ❌';
      icon = Icons.dangerous_rounded;
      color = const Color(0xFFEF4444);
    }
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                )),
          ),
        ],
      ),
    );
  }
}
