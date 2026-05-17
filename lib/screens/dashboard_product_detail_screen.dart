import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/dashboard_catalog.dart';
import '../services/oferta_service.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

/// Pantalla de detalle para [DashboardProduct] (catálogo unificado).
class DashboardProductDetailScreen extends StatefulWidget {
  final DashboardProduct product;
  const DashboardProductDetailScreen({super.key, required this.product});

  @override
  State<DashboardProductDetailScreen> createState() =>
      _DashboardProductDetailScreenState();
}

class _DashboardProductDetailScreenState
    extends State<DashboardProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entry;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _entry = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _fade = CurvedAnimation(parent: _entry, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entry, curve: Curves.easeOutCubic));
    _entry.forward();
  }

  @override
  void dispose() {
    _entry.dispose();
    super.dispose();
  }

  String _euro(double v) {
    if (v <= 0) return '—';
    final p = v.toInt();
    final s = p.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
    return '$s €';
  }

  Future<void> _whatsApp() async {
    final p = widget.product;
    final msg =
        'Hola, me interesa el producto "${p.name}" (ref: ${p.id}). ¿Podéis pasarme más información?';
    await openUrl(
        'https://wa.me/34662078540?text=${Uri.encodeComponent(msg)}');
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final cat = DashboardCatalog.catOf(p.cat);
    final brand =
        DashboardCatalog.brandColors[p.sub] ?? AppTheme.primary;
    final margen = p.pvp - p.coste;
    final margenPct = p.coste == 0 ? 0 : (margen / p.coste) * 100;
    final margenPvdPvp = p.pvp - p.pvd;
    final hasPhoto = p.asset != null;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                backgroundColor: AppTheme.surface,
                foregroundColor: AppTheme.textPrimary,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: AppTheme.textPrimary, size: 20),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.chat_rounded,
                          color: AppTheme.whatsapp, size: 20),
                      onPressed: _whatsApp,
                      tooltip: 'WhatsApp',
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (hasPhoto)
                        Image.asset(
                          p.asset!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              _PlaceholderHero(cat: cat, color: brand),
                        )
                      else
                        _PlaceholderHero(cat: cat, color: brand),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                AppTheme.surface,
                                AppTheme.surface.withValues(alpha: 0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: brand,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: brand.withValues(alpha: 0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(cat.icon,
                                  style: const TextStyle(fontSize: 11)),
                              const SizedBox(width: 4),
                              Text(
                                cat.label,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.4,
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Marca + ID
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(
                              color: brand.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              p.sub.toUpperCase(),
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: brand,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Ref. ${p.id}',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: AppTheme.textHint,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Nombre
                      Text(
                        p.name,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.textPrimary,
                          height: 1.2,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Precios principal
                      _PriceCard(
                        label: 'PVP cliente final',
                        value: _euro(p.pvp),
                        color: AppTheme.primary,
                        big: true,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: _PriceCard(
                              label: 'PVD distribuidor',
                              value: _euro(p.pvd),
                              color: const Color(0xFF7E22CE),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _PriceCard(
                              label: 'Coste interno',
                              value: _euro(p.coste),
                              color: const Color(0xFFDC2626),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Métricas de margen
                      Container(
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
                          border: Border.all(
                              color: AppTheme.primary
                                  .withValues(alpha: 0.18)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.show_chart_rounded,
                                    size: 18, color: AppTheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  'Margen interno',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _MetricRow(
                              label: 'Margen PVP − Coste',
                              value: _euro(margen),
                              pct: '${margenPct.toStringAsFixed(1)}%',
                              color: const Color(0xFF16A34A),
                            ),
                            const Divider(height: 18),
                            _MetricRow(
                              label: 'Margen PVP − PVD',
                              value: _euro(margenPvdPvp),
                              pct: p.pvd == 0
                                  ? '—'
                                  : '${((margenPvdPvp / p.pvd) * 100).toStringAsFixed(1)}%',
                              color: AppTheme.primary,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Acciones
                      _ActionsRow(product: p),

                      const SizedBox(height: 12),

                      // Info contextual
                      _InfoCard(
                        title: 'Sobre este producto',
                        content:
                            'Pertenece a la categoría "${cat.label}" de la marca ${p.sub}. '
                            'Los precios mostrados son orientativos (sin IVA). '
                            'Para condiciones especiales y financiación contacta por WhatsApp.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────────

class _PlaceholderHero extends StatelessWidget {
  final DashboardCategory cat;
  final Color color;
  const _PlaceholderHero({required this.cat, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.20),
            color.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cat.icon, style: const TextStyle(fontSize: 96)),
            const SizedBox(height: 8),
            Text(
              cat.label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final bool big;
  const _PriceCard({
    required this.label,
    required this.value,
    required this.color,
    this.big = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(big ? 16 : 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
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
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: big ? 26 : 16,
              fontWeight: FontWeight.w900,
              color: color,
              letterSpacing: -0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  final String label;
  final String value;
  final String pct;
  final Color color;
  const _MetricRow({
    required this.label,
    required this.value,
    required this.pct,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            pct,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final DashboardProduct product;
  const _ActionsRow({required this.product});

  Future<void> _whatsApp() async {
    final msg =
        'Hola, me interesa el producto "${product.name}" (ref: ${product.id}). ¿Podéis pasarme más información?';
    await openUrl(
        'https://wa.me/34662078540?text=${Uri.encodeComponent(msg)}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: _whatsApp,
            icon: const Icon(Icons.chat_rounded),
            label: Text(
              'Consultar por WhatsApp',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.whatsapp,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 44,
          child: OutlinedButton.icon(
            onPressed: () {
              final svc = context.read<OfertaService>();
              svc.add(product);
              HapticFeedback.mediumImpact();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} añadido a la oferta'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppTheme.primary,
                  duration: const Duration(milliseconds: 1400),
                ),
              );
            },
            icon: const Icon(Icons.receipt_long_rounded, size: 18),
            label: Text(
              'Añadir a oferta',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primary,
              side: const BorderSide(color: AppTheme.primary, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const _InfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline_rounded,
                  size: 16, color: AppTheme.primary),
              const SizedBox(width: 6),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
