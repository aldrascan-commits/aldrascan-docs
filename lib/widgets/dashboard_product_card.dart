import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/dashboard_catalog.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

/// Tarjeta de producto basada en [DashboardProduct] (catálogo unificado).
/// Reemplaza al antiguo [ProductCard] que dependía del modelo legacy `Product`.
class DashboardProductCard extends StatefulWidget {
  final DashboardProduct product;
  final VoidCallback onTap;

  /// Modo de presentación de precio: 'pvp' (cliente final) o 'pvd' (distribuidor)
  final String priceMode;

  /// Texto opcional de WhatsApp personalizado. Si es null se usa uno genérico.
  final String? whatsappMessage;

  const DashboardProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.priceMode = 'pvp',
    this.whatsappMessage,
  });

  @override
  State<DashboardProductCard> createState() => _DashboardProductCardState();
}

class _DashboardProductCardState extends State<DashboardProductCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleCtrl;
  bool _hover = false;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 140),
      lowerBound: 0.96,
      upperBound: 1.0,
    )..value = 1.0;
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  String _euro(double v) {
    if (v <= 0) return 'Consultar';
    final p = v.toInt();
    final s = p.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
    return '$s €';
  }

  void _openWhatsApp() {
    final msg = widget.whatsappMessage ??
        'Hola, me interesa el producto ${widget.product.name} (ref: ${widget.product.id}). ¿Podéis pasarme información?';
    final url =
        'https://wa.me/34662078540?text=${Uri.encodeComponent(msg)}';
    openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final cat = DashboardCatalog.catOf(p.cat);
    final brandColor =
        DashboardCatalog.brandColors[p.sub] ?? AppTheme.primary;
    final isScanner = p.cat == 'scanner';
    final hasPhoto = p.asset != null;
    final price = widget.priceMode == 'pvd' ? p.pvd : p.pvp;

    return ScaleTransition(
      scale: _scaleCtrl,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTapDown: (_) => _scaleCtrl.reverse(),
          onTapUp: (_) {
            _scaleCtrl.forward();
            HapticFeedback.selectionClick();
            widget.onTap();
          },
          onTapCancel: () => _scaleCtrl.forward(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppTheme.cardBg,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: _hover
                    ? brandColor.withValues(alpha: 0.55)
                    : AppTheme.divider,
                width: 1.2,
              ),
              boxShadow: _hover
                  ? [
                      BoxShadow(
                        color: brandColor.withValues(alpha: 0.18),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : AppTheme.cardShadow,
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Imagen / placeholder ────────────────────────────────
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.05,
                      child: hasPhoto
                          ? Image.asset(
                              p.asset!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  _Placeholder(cat: cat, color: brandColor),
                            )
                          : _Placeholder(cat: cat, color: brandColor),
                    ),
                    // Gradient inferior para legibilidad
                    Positioned(
                      bottom: 0, left: 0, right: 0,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppTheme.cardBg.withValues(alpha: 0.9),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Badge categoría (top-left)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: _Pill(
                        label: '${cat.icon} ${cat.label}',
                        color: brandColor,
                      ),
                    ),
                    // Badge marca (top-right) si hay
                    if (p.sub.isNotEmpty)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: _Pill(
                          label: p.sub,
                          color: brandColor,
                          inverted: true,
                        ),
                      ),
                  ],
                ),

                // ── Contenido ───────────────────────────────────────────
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.name,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                            height: 1.25,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),

                        // Precio o CTA
                        if (isScanner)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFE65100), Color(0xFFFF8F00)],
                              ),
                              borderRadius: BorderRadius.circular(9),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE65100)
                                      .withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_offer_rounded,
                                    size: 11, color: Colors.white),
                                SizedBox(width: 5),
                                Text(
                                  'Solicita Oferta',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _euro(price),
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.primary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text(
                                  widget.priceMode.toUpperCase(),
                                  style: GoogleFonts.inter(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.textHint,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: 9),

                        // Botón WhatsApp
                        SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: _openWhatsApp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.whatsapp,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.chat_rounded, size: 13),
                                SizedBox(width: 5),
                                Text(
                                  'Consultar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final DashboardCategory cat;
  final Color color;
  const _Placeholder({required this.cat, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.08),
            color.withValues(alpha: 0.02),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cat.icon, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 4),
            Text(
              cat.label,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color color;
  final bool inverted;
  const _Pill({
    required this.label,
    required this.color,
    this.inverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: inverted ? Colors.white.withValues(alpha: 0.95) : color,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: inverted ? color : Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
