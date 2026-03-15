import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onWhatsApp;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onWhatsApp,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 140),
      lowerBound: 0.96,
      upperBound: 1.0,
    )..value = 1.0;
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _scaleController.reverse();
  void _onTapUp(TapUpDetails _) {
    _scaleController.forward();
    widget.onTap();
  }
  void _onTapCancel() => _scaleController.forward();

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isScanner = product.category == 'scanner';

    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppTheme.cardBg,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: _isHovered
                    ? AppTheme.primary.withValues(alpha: 0.4)
                    : AppTheme.divider,
                width: 1.2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: 0.15),
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
                // ── Imagen ──────────────────────────────────────────────────
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.05,
                      child: Image.asset(
                        product.imageAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppTheme.surfaceVariant,
                          child: const Center(
                            child: Icon(Icons.image_outlined,
                                size: 40, color: AppTheme.textHint),
                          ),
                        ),
                      ),
                    ),
                    // Gradiente inferior imagen
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
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
                    // Badge
                    if (product.badge != null)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: _BadgeChip(
                          label: product.badge!,
                          color: AppTheme.badgeColor(product.badge),
                        ),
                      ),
                    // Featured star
                    if (product.isFeatured)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF8E1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withValues(alpha: 0.4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.star_rounded,
                              size: 16, color: Color(0xFFF9A825)),
                        ),
                      ),
                  ],
                ),

                // ── Contenido ───────────────────────────────────────────────
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nombre
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                            height: 1.25,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Subtítulo
                        if (product.subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(
                            product.subtitle!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppTheme.textSecondary,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],

                        const Spacer(),

                        // Precio / CTA Solicitar Oferta
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
                                  color: const Color(0xFFE65100).withValues(alpha: 0.3),
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
                        else if (product.price != null)
                          Text(
                            product.formattedPrice,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primary,
                            ),
                          )
                        else
                          const Text(
                            'Consultar precio',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.textSecondary,
                            ),
                          ),

                        // Financiación (solo no-escáneres)
                        if (!isScanner && product.financing != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.credit_card_rounded,
                                  size: 10, color: AppTheme.badgeGreen),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  product.financing!,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: AppTheme.badgeGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],

                        const SizedBox(height: 9),

                        // Botón WhatsApp mejorado
                        SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: widget.onWhatsApp,
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

class _BadgeChip extends StatelessWidget {
  final String label;
  final Color color;

  const _BadgeChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.45),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
