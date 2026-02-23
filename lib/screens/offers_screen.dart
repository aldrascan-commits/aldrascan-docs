import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  Future<void> _openWhatsApp(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final topOffers = ProductData.topOffers;
    final allExpodental = ProductData.expodental;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          // ── AppBar ────────────────────────────────────────────────────────
          SliverAppBar(
            floating: true,
            pinned: false,
            backgroundColor: AppTheme.surface,
            elevation: 0,
            title: const Text(
              'Ofertas Expodental 2026',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: AppTheme.divider),
            ),
          ),

          // ── Contenido ────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Banner Expodental Hero ────────────────────────────────
                _ExpodentralHeroBanner(
                  onTap: () => _openWhatsApp(
                      'https://wa.me/34662078540?text=Hola,%20quiero%20informaci%C3%B3n%20sobre%20las%20ofertas%20Expodental%202026'),
                ),
                const SizedBox(height: 20),

                // ── Métricas clave ────────────────────────────────────────
                _MetricsRow(),
                const SizedBox(height: 24),

                // ── Top 3 Ofertas Estrella ────────────────────────────────
                _SectionTitle(
                  icon: Icons.star_rounded,
                  iconColor: const Color(0xFFF57F17),
                  title: 'Top 3 Ofertas Estrella',
                  subtitle: 'Selección exclusiva Expodental 2026',
                ),
                const SizedBox(height: 12),
                _Top3Section(
                  products: topOffers,
                  onWhatsApp: _openWhatsApp,
                  onTap: (p) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: p)),
                  ),
                ),
                const SizedBox(height: 28),

                // ── Financiación desde 72€/mes ────────────────────────────
                _FinancingHiglight(),
                const SizedBox(height: 24),

                // ── Todos los productos Expodental ────────────────────────
                _SectionTitle(
                  icon: Icons.local_offer_rounded,
                  iconColor: AppTheme.primary,
                  title: 'Catálogo Expodental 2026',
                  subtitle:
                      '${allExpodental.length} productos con precios especiales de feria',
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.63,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: allExpodental.length,
                    itemBuilder: (ctx, i) => ProductCard(
                      product: allExpodental[i],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailScreen(product: allExpodental[i]),
                        ),
                      ),
                      onWhatsApp: () =>
                          _openWhatsApp(allExpodental[i].whatsappUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // ── Banner contacto final ─────────────────────────────────
                _ContactCTABanner(
                  onTap: () => _openWhatsApp(
                      'https://wa.me/34662078540?text=Hola,%20me%20interesa%20reservar%20una%20oferta%20Expodental%202026'),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Expodental Hero Banner ────────────────────────────────────────────────────
class _ExpodentralHeroBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _ExpodentralHeroBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1565C0), Color(0xFF1E88E5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '⚡ EXPODENTAL 2026',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF57F17),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Stock Limitado',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Digitaliza tu clínica\nen 2026',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'No vendemos equipos.\nImplementamos flujo digital completo.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '🟢 Solicitar oferta Expodental →',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Métricas Row ──────────────────────────────────────────────────────────────
class _MetricsRow extends StatelessWidget {
  final List<Map<String, String>> _metrics = const [
    {'value': '+200', 'label': 'Clínicas\ndigitalizadas'},
    {'value': '24/7', 'label': 'Soporte\ntécnico'},
    {'value': '100%', 'label': 'Formación\nincluida'},
    {'value': '60m', 'label': 'Financiación\ndisponible'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _metrics.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (ctx, i) => Container(
          width: 82,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.divider),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _metrics[i]['value']!,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _metrics[i]['label']!,
                style: const TextStyle(
                  fontSize: 9,
                  color: AppTheme.textSecondary,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Section Title ─────────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary)),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 11, color: AppTheme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Top 3 Section (horizontal cards grandes) ──────────────────────────────────
class _Top3Section extends StatelessWidget {
  final List<Product> products;
  final Function(String) onWhatsApp;
  final Function(Product) onTap;

  const _Top3Section({
    required this.products,
    required this.onWhatsApp,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (ctx, i) => _Top3Card(
          product: products[i],
          rank: i + 1,
          onWhatsApp: () => onWhatsApp(products[i].whatsappUrl),
          onTap: () => onTap(products[i]),
        ),
      ),
    );
  }
}

class _Top3Card extends StatelessWidget {
  final Product product;
  final int rank;
  final VoidCallback onWhatsApp;
  final VoidCallback onTap;

  const _Top3Card({
    required this.product,
    required this.rank,
    required this.onWhatsApp,
    required this.onTap,
  });

  Color get _rankColor {
    if (rank == 1) return const Color(0xFFF57F17);
    if (rank == 2) return AppTheme.primary;
    return const Color(0xFF388E3C);
  }

  String get _rankLabel {
    if (rank == 1) return '⭐ Iniciación';
    if (rank == 2) return '🏆 Best Seller';
    return '👑 Top Ventas';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _rankColor.withValues(alpha: 0.4), width: 1.5),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rank badge
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: _rankColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _rankLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Nombre
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Precio grande
            Text(
              product.formattedPrice,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: _rankColor,
              ),
            ),
            if (product.monthlyFee != null) ...[
              Text(
                'desde ${product.formattedMonthlyFee}',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.badgeGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            const Spacer(),

            // Botón
            SizedBox(
              width: double.infinity,
              height: 32,
              child: ElevatedButton(
                onPressed: onWhatsApp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _rankColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.zero,
                ),
                child: const Text('Solicitar',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Financing Highlight ───────────────────────────────────────────────────────
class _FinancingHiglight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet_outlined,
              color: Colors.white, size: 32),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Desde 72 €/mes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Financiación hasta 60 meses\n✓ Instalación incluida  ✓ Formación incluida',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Contact CTA Banner ────────────────────────────────────────────────────────
class _ContactCTABanner extends StatelessWidget {
  final VoidCallback onTap;
  const _ContactCTABanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F7FF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFBBDEFB)),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppTheme.whatsapp,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.chat_outlined,
                  color: Colors.white, size: 22),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reserva tu oferta Expodental',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Stock muy limitado – Escríbenos ahora',
                    style: TextStyle(
                        fontSize: 11, color: AppTheme.textSecondary),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 14, color: AppTheme.textHint),
          ],
        ),
      ),
    );
  }
}
