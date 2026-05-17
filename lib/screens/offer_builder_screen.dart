import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/dashboard_catalog.dart';
import '../services/oferta_service.dart';

/// Constructor de Ofertas (replica de la página 5 del dashboard HTML).
/// - Cliente + tipo de oferta (PVD / PVP)
/// - Líneas reactivas (qty, dto% por línea, eliminar)
/// - IVA configurable (0/4/10/21)
/// - Totales: coste, base, descuento, neto, IVA, total c/IVA
/// - Margen € y % sobre coste
/// - Botones de export como stubs ("Próximamente")
class OfferBuilderScreen extends StatefulWidget {
  const OfferBuilderScreen({super.key});

  @override
  State<OfferBuilderScreen> createState() => _OfferBuilderScreenState();
}

class _OfferBuilderScreenState extends State<OfferBuilderScreen> {
  final _clienteCtrl = TextEditingController();
  String _tipo = 'pvp'; // 'pvd' o 'pvp'

  @override
  void dispose() {
    _clienteCtrl.dispose();
    super.dispose();
  }

  String _euro(double v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return '${buf.toString()} €';
  }

  String _euroDec(double v) {
    final n = v.toStringAsFixed(2);
    final parts = n.split('.');
    final intPart = parts[0];
    final buf = StringBuffer();
    for (int i = 0; i < intPart.length; i++) {
      if (i > 0 && (intPart.length - i) % 3 == 0) buf.write('.');
      buf.write(intPart[i]);
    }
    return '${buf.toString()},${parts[1]} €';
  }

  void _stub(String label) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label · Próximamente disponible'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTheme.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Consumer<OfertaService>(
        builder: (context, svc, _) {
          return CustomScrollView(
            slivers: [
              _buildAppBar(svc),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildClienteCard(svc),
                    const SizedBox(height: 14),
                    _buildAddProductCard(svc),
                    const SizedBox(height: 14),
                    _buildLineasCard(svc),
                    const SizedBox(height: 14),
                    _buildResumenCard(svc),
                    const SizedBox(height: 14),
                    _buildExportCard(svc),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ── AppBar ────────────────────────────────────────────────────────────
  Widget _buildAppBar(OfertaService svc) {
    return SliverAppBar(
      expandedHeight: 130,
      pinned: true,
      backgroundColor: AppTheme.primary,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 14, right: 16),
        title: Text(
          'Constructor de Ofertas',
          style: GoogleFonts.inter(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppTheme.primary, Color(0xFF0A3C7A)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 50),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.receipt_long_rounded,
                        size: 14, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      '${svc.count} ${svc.count == 1 ? "línea" : "líneas"}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
        if (!svc.isEmpty)
          IconButton(
            icon: const Icon(Icons.delete_sweep_rounded),
            tooltip: 'Limpiar oferta',
            onPressed: () => _confirmClear(svc),
          ),
      ],
    );
  }

  // ── Cliente + tipo ──────────────────────────────────────────────────
  Widget _buildClienteCard(OfertaService svc) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline_rounded,
                  size: 18, color: AppTheme.primary),
              const SizedBox(width: 8),
              Text(
                'Cliente y tipo de oferta',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _clienteCtrl,
            style: GoogleFonts.inter(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Nombre del cliente o clínica…',
              hintStyle: GoogleFonts.inter(
                  fontSize: 13, color: AppTheme.textHint),
              prefixIcon: const Icon(Icons.search_rounded, size: 20),
              filled: true,
              fillColor: AppTheme.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _TipoChip(
                  label: 'Cliente (PVP)',
                  icon: '👥',
                  selected: _tipo == 'pvp',
                  color: const Color(0xFF16A34A),
                  onTap: () => setState(() => _tipo = 'pvp'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _TipoChip(
                  label: 'Distrib. (PVD)',
                  icon: '🏢',
                  selected: _tipo == 'pvd',
                  color: const Color(0xFF7E22CE),
                  onTap: () => setState(() => _tipo = 'pvd'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // IVA picker
          Row(
            children: [
              Text('IVA:',
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textSecondary)),
              const SizedBox(width: 8),
              for (final iva in const [0, 4, 10, 21])
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      svc.setIva(iva);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: svc.ivaPct == iva
                            ? AppTheme.primary
                            : AppTheme.background,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: svc.ivaPct == iva
                              ? AppTheme.primary
                              : AppTheme.divider,
                        ),
                      ),
                      child: Text(
                        '$iva%',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: svc.ivaPct == iva
                              ? Colors.white
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Añadir producto ────────────────────────────────────────────────
  Widget _buildAddProductCard(OfertaService svc) {
    return GestureDetector(
      onTap: () => _openProductPicker(svc),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primary, Color(0xFF0A3C7A)],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.35),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add_circle_outline_rounded,
                  color: Colors.white, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Añadir productos',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Busca en el catálogo (${DashboardCatalog.products.length} SKUs)',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // ── Líneas de oferta ────────────────────────────────────────────────
  Widget _buildLineasCard(OfertaService svc) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
            child: Row(
              children: [
                Icon(Icons.list_alt_rounded,
                    size: 18, color: AppTheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Líneas de oferta',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const Spacer(),
                if (!svc.isEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${svc.count}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (svc.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 24, 14, 28),
              child: Center(
                child: Column(
                  children: [
                    const Text('📋', style: TextStyle(fontSize: 36)),
                    const SizedBox(height: 10),
                    Text(
                      'Sin líneas todavía',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pulsa "Añadir productos" para empezar',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppTheme.textHint,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...svc.lines.map((l) => _LineaTile(
                  line: l,
                  tipo: _tipo,
                  formatEur: _euroDec,
                  onQty: (q) => svc.setQty(l.product.id, q),
                  onDto: (d) => svc.setLineDiscount(l.product.id, d),
                  onRemove: () => svc.remove(l.product.id),
                )),
        ],
      ),
    );
  }

  // ── Resumen ─────────────────────────────────────────────────────────
  Widget _buildResumenCard(OfertaService svc) {
    final base = _tipo == 'pvd' ? svc.totalPvd : svc.pvpBruto;
    // Para el resumen usamos pvpConLineas (descuentos por línea, no pack)
    final neto = _tipo == 'pvd'
        ? svc.totalPvd // PVD normalmente sin descuento
        : svc.pvpConLineas;
    final dto = base - neto;
    final iva = neto * svc.ivaPct / 100;
    final total = neto + iva;
    final margenAbs = neto - svc.totalCoste;
    final margenPct = neto == 0 ? 0.0 : (margenAbs / neto) * 100;
    final tipoLabel =
        _tipo == 'pvd' ? '🏢 Oferta a Distribuidor' : '👥 Oferta a Cliente final';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primary.withValues(alpha: 0.04),
            AppTheme.surface,
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.summarize_rounded,
                  size: 18, color: AppTheme.primary),
              const SizedBox(width: 8),
              Text(
                tipoLabel,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _row('Coste total',           _euroDec(svc.totalCoste),
              valueColor: const Color(0xFFDC2626)),
          _row('Precio base',           _euroDec(base)),
          _row('Descuento total',       '−${_euroDec(dto)}',
              valueColor: const Color(0xFFDC2626)),
          _row('Neto sin IVA',          _euroDec(neto)),
          _row('IVA (${svc.ivaPct}%)',  _euroDec(iva)),
          const Divider(height: 22),
          _row(
            'Total con IVA',
            _euroDec(total),
            big: true,
            valueColor: AppTheme.primary,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MetricBox(
                  label: 'Margen €',
                  value: _euro(margenAbs),
                  color: margenAbs >= 0
                      ? const Color(0xFF16A34A)
                      : const Color(0xFFDC2626),
                  sub: 'neto − coste',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricBox(
                  label: '% Margen',
                  value: '${margenPct.toStringAsFixed(1)}%',
                  color: AppTheme.primary,
                  sub: 'sobre venta',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value,
      {Color? valueColor, bool big = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: big ? 4 : 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: big ? 13 : 12,
              fontWeight: big ? FontWeight.w800 : FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: big ? 17 : 13,
              fontWeight: FontWeight.w800,
              color: valueColor ?? AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Export buttons (stubs) ──────────────────────────────────────────
  Widget _buildExportCard(OfertaService svc) {
    if (svc.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.ios_share_rounded,
                  size: 18, color: AppTheme.primary),
              const SizedBox(width: 8),
              Text(
                'Compartir oferta',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ExportBtn(
                  icon: Icons.picture_as_pdf_rounded,
                  label: 'PDF',
                  color: const Color(0xFFDC2626),
                  onTap: () => _stub('Exportar PDF')),
              _ExportBtn(
                  icon: Icons.table_chart_rounded,
                  label: 'Excel',
                  color: const Color(0xFF16A34A),
                  onTap: () => _stub('Exportar Excel')),
              _ExportBtn(
                  icon: Icons.text_snippet_rounded,
                  label: 'CSV',
                  color: const Color(0xFFEA580C),
                  onTap: () => _stub('Exportar CSV')),
              _ExportBtn(
                  icon: Icons.email_rounded,
                  label: 'Email',
                  color: const Color(0xFF475569),
                  onTap: () => _stub('Enviar por Email')),
              _ExportBtn(
                  icon: Icons.chat_rounded,
                  label: 'WhatsApp',
                  color: const Color(0xFF22C55E),
                  onTap: () => _stub('Compartir WhatsApp')),
            ],
          ),
        ],
      ),
    );
  }

  // ── Acciones ────────────────────────────────────────────────────────
  void _confirmClear(OfertaService svc) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Limpiar oferta',
          style: GoogleFonts.inter(fontWeight: FontWeight.w800),
        ),
        content: Text(
          '¿Eliminar las ${svc.count} líneas de la oferta actual?',
          style: GoogleFonts.inter(fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              svc.clear();
              Navigator.pop(ctx);
              HapticFeedback.mediumImpact();
            },
            style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFDC2626)),
            child: const Text('Limpiar'),
          ),
        ],
      ),
    );
  }

  void _openProductPicker(OfertaService svc) {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ProductPickerSheet(service: svc),
    );
  }
}

// ╔═══════════════════════════════════════════════════════════════════╗
// ║                       SUB-WIDGETS                                  ║
// ╚═══════════════════════════════════════════════════════════════════╝

class _TipoChip extends StatelessWidget {
  final String label;
  final String icon;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _TipoChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? color.withValues(alpha: 0.10) : AppTheme.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? color : AppTheme.divider,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: selected ? color : AppTheme.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LineaTile extends StatelessWidget {
  final OfertaLine line;
  final String tipo;
  final String Function(double) formatEur;
  final ValueChanged<int> onQty;
  final ValueChanged<double> onDto;
  final VoidCallback onRemove;

  const _LineaTile({
    required this.line,
    required this.tipo,
    required this.formatEur,
    required this.onQty,
    required this.onDto,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final p = line.product;
    final pvBase = (tipo == 'pvd' ? p.pvd : p.pvp) * line.qty;
    final neto = pvBase * (1 - line.discountPct / 100);
    final margen = neto - line.coste;
    final margenPct = neto == 0 ? 0 : (margen / neto) * 100;
    final catColor =
        DashboardCatalog.brandColors[p.sub] ?? AppTheme.textHint;

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 6),
      padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.divider.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera: marca · nombre · borrar
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 36,
                margin: const EdgeInsets.only(right: 8, top: 2),
                decoration: BoxDecoration(
                  color: catColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.sub.toUpperCase(),
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: catColor,
                      ),
                    ),
                    Text(
                      p.name,
                      style: GoogleFonts.inter(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close_rounded,
                    size: 18, color: Color(0xFFDC2626)),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  onRemove();
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Qty + Dto
          Row(
            children: [
              // Cantidad
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.divider),
                ),
                child: Row(
                  children: [
                    _QtyBtn(
                        icon: Icons.remove_rounded,
                        onTap: () => onQty(line.qty - 1)),
                    SizedBox(
                      width: 30,
                      child: Text(
                        '${line.qty}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    _QtyBtn(
                        icon: Icons.add_rounded,
                        onTap: () => onQty(line.qty + 1)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // Slider de descuento
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Dto.',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textHint,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${line.discountPct.toStringAsFixed(0)}%',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: line.discountPct > 0
                                ? const Color(0xFFEA580C)
                                : AppTheme.textHint,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 7),
                        overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 14),
                        activeTrackColor: const Color(0xFFEA580C),
                        inactiveTrackColor: AppTheme.divider,
                        thumbColor: const Color(0xFFEA580C),
                      ),
                      child: Slider(
                        value: line.discountPct,
                        min: 0,
                        max: 50,
                        divisions: 50,
                        onChanged: onDto,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Totales línea
          const Divider(height: 12),
          Row(
            children: [
              _miniInfo('Base', formatEur(pvBase),
                  color: AppTheme.textSecondary),
              const SizedBox(width: 14),
              _miniInfo('Neto', formatEur(neto), color: AppTheme.primary),
              const Spacer(),
              _miniInfo(
                '% Mg',
                '${margenPct.toStringAsFixed(0)}%',
                color: margen >= 0
                    ? const Color(0xFF16A34A)
                    : const Color(0xFFDC2626),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniInfo(String label, String value, {required Color color}) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: GoogleFonts.inter(
            fontSize: 10,
            color: AppTheme.textHint,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 16, color: AppTheme.primary),
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String label;
  final String value;
  final String sub;
  final Color color;

  const _MetricBox({
    required this.label,
    required this.value,
    required this.sub,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: color,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: color,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            sub,
            style: GoogleFonts.inter(
              fontSize: 9,
              color: color.withValues(alpha: 0.75),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExportBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ExportBtn({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ╔═══════════════════════════════════════════════════════════════════╗
// ║                  PRODUCT PICKER (BottomSheet)                      ║
// ╚═══════════════════════════════════════════════════════════════════╝

class _ProductPickerSheet extends StatefulWidget {
  final OfertaService service;
  const _ProductPickerSheet({required this.service});

  @override
  State<_ProductPickerSheet> createState() => _ProductPickerSheetState();
}

class _ProductPickerSheetState extends State<_ProductPickerSheet> {
  String _query = '';
  String? _cat;

  List<DashboardProduct> get _filtered {
    return DashboardCatalog.products.where((p) {
      if (_cat != null && p.cat != _cat) return false;
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return p.name.toLowerCase().contains(q) ||
          p.sub.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollCtrl) {
        return Container(
          decoration: const BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 10, bottom: 8),
                decoration: BoxDecoration(
                  color: AppTheme.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: Row(
                  children: [
                    Text(
                      'Añadir productos',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              // Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  autofocus: false,
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    hintText: 'Buscar producto, marca…',
                    prefixIcon: const Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: AppTheme.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Cat chips
              SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _catChip(label: 'Todas', value: null),
                    for (final c in DashboardCatalog.categories)
                      _catChip(
                        label: c.label,
                        value: c.id,
                        icon: c.icon,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              // Results
              Expanded(
                child: _filtered.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('🔎',
                                style: TextStyle(fontSize: 36)),
                            const SizedBox(height: 8),
                            Text(
                              'Sin resultados',
                              style: GoogleFonts.inter(
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: scrollCtrl,
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: _filtered.length,
                        itemBuilder: (ctx, i) {
                          final p = _filtered[i];
                          final inOferta =
                              widget.service.contains(p.id);
                          return _PickerRow(
                            product: p,
                            selected: inOferta,
                            onTap: () {
                              HapticFeedback.selectionClick();
                              widget.service.add(p);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${p.name} añadido'),
                                  duration: const Duration(milliseconds: 900),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: AppTheme.primary,
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _catChip({required String label, String? value, String? icon}) {
    final sel = _cat == value;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: GestureDetector(
        onTap: () => setState(() => _cat = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: sel ? AppTheme.primary : AppTheme.background,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                color: sel ? AppTheme.primary : AppTheme.divider),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Text(icon, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w800,
                  color: sel ? Colors.white : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickerRow extends StatelessWidget {
  final DashboardProduct product;
  final bool selected;
  final VoidCallback onTap;

  const _PickerRow({
    required this.product,
    required this.selected,
    required this.onTap,
  });

  String _euro(double v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return '${buf.toString()} €';
  }

  @override
  Widget build(BuildContext context) {
    final catColor =
        DashboardCatalog.brandColors[product.sub] ?? AppTheme.textHint;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: AppTheme.divider.withValues(alpha: 0.5)),
          ),
        ),
        child: Row(
          children: [
            // Thumb / placeholder
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: catColor.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: product.asset != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.asset!,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Text(
                          DashboardCatalog.catOf(product.cat).icon,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : Text(
                      DashboardCatalog.catOf(product.cat).icon,
                      style: const TextStyle(fontSize: 18),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.sub.toUpperCase(),
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.4,
                      color: catColor,
                    ),
                  ),
                  Text(
                    product.name,
                    style: GoogleFonts.inter(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      height: 1.25,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'PVP ${_euro(product.pvp)} · PVD ${_euro(product.pvd)}',
                    style: GoogleFonts.inter(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF16A34A).withValues(alpha: 0.15)
                    : AppTheme.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                selected
                    ? Icons.check_circle_rounded
                    : Icons.add_circle_outline_rounded,
                size: 20,
                color: selected
                    ? const Color(0xFF16A34A)
                    : AppTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
