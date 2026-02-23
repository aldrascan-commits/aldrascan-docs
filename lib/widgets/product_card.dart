import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

/// Widget para imágenes que soporta tanto URLs http como paths locales web
class _ProductImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const _ProductImage({required this.imageUrl, this.fit = BoxFit.cover});

  bool get _isNetwork => imageUrl.startsWith('http');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (_, __) => Container(
          color: AppTheme.background,
          child: const Center(
            child: CircularProgressIndicator(
                strokeWidth: 2, color: AppTheme.primary),
          ),
        ),
        errorWidget: (_, __, ___) => Container(
          color: AppTheme.background,
          child: const Icon(Icons.image_outlined,
              size: 40, color: AppTheme.textHint),
        ),
      );
    }
    // Imagen local en assets/images/
    return Image.asset(
      'assets/images/$imageUrl',
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        color: AppTheme.background,
        child: const Icon(Icons.image_outlined,
            size: 40, color: AppTheme.textHint),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.divider, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Imagen + badge ──────────────────────────────────────────────
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: _ProductImage(imageUrl: product.imageUrl),
                ),
                if (product.badge != null)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: _BadgeChip(
                      label: product.badge!,
                      color: AppTheme.badgeColor(product.badge),
                    ),
                  ),
              ],
            ),

            // ── Contenido ──────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  // Precio
                  if (product.price != null)
                    Text(
                      product.formattedPrice,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary,
                      ),
                    )
                  else
                    const Text(
                      'Consultar precio',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textSecondary,
                      ),
                    ),

                  // Cuota mensual
                  if (product.monthlyFee != null) ...[
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.payments_outlined,
                            size: 12, color: AppTheme.badgeGreen),
                        const SizedBox(width: 4),
                        Text(
                          'desde ${product.formattedMonthlyFee}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppTheme.badgeGreen,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ] else if (product.financing != null) ...[
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.credit_card_outlined,
                            size: 12, color: AppTheme.badgeGreen),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            product.financing!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppTheme.badgeGreen,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                  // Ahorro
                  if (product.savings != null) ...[
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.savings_outlined,
                            size: 12, color: Color(0xFFF57F17)),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            product.savings!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFFF57F17),
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 10),

                  // Botón WhatsApp
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: ElevatedButton.icon(
                      onPressed: onWhatsApp,
                      icon: const Icon(Icons.chat_outlined, size: 14),
                      label: const Text('Solicitar info',
                          style: TextStyle(fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.whatsapp,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
