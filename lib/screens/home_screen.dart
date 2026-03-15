import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/url_helper.dart';
import '../data/products_data.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final void Function(String category)? onNavigateToCatalog;
  const HomeScreen({super.key, this.onNavigateToCatalog});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController _bannerController;
  late Timer _bannerTimer;
  int _bannerIndex = 0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final List<_BannerData> _banners = const [
    _BannerData(
      gradient: [Color(0xFF0D3B73), Color(0xFF1352A0)],
      tag: '⚡ EXPODENTAL 2026',
      title: 'Digitaliza tu\nclínica hoy',
      subtitle: 'Escáneres · CAD/CAM · CBCT\nFinanciación hasta 60 meses',
      cta: 'Ver catálogo',
      icon: Icons.document_scanner_outlined,
    ),
    _BannerData(
      gradient: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
      tag: '🎁 REGALO INCLUIDO',
      title: 'i900 Mobility\n+ iPad Pro M5',
      subtitle: '100% inalámbrico · 70 FPS\nFormación y certificación',
      cta: 'Solicitar oferta',
      icon: Icons.wifi_tethering_rounded,
    ),
    _BannerData(
      gradient: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
      tag: '💳 COLEGIADOS',
      title: 'Empieza a\nproducir hoy',
      subtitle: '3 meses de carencia inicial\nPaga dentro de 90 días',
      cta: 'Consultar',
      icon: Icons.credit_score_outlined,
    ),
    _BannerData(
      gradient: [Color(0xFFBF360C), Color(0xFFE64A19)],
      tag: '🏆 PACK CLÍNICA',
      title: 'AldraScan Pro\nTodo en el mismo día',
      subtitle: 'Diagnóstico · Escaneo · Restauración\nInstalación y formación incluidas',
      cta: 'Ver pack',
      icon: Icons.business_center_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _bannerController = PageController(viewportFraction: 1.0);
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();

    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final next = (_bannerIndex + 1) % _banners.length;
      _bannerController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _bannerTimer.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _openWhatsApp(String url) async => openUrl(url);

  @override
  Widget build(BuildContext context) {
    final featured = ProductData.featured;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── App Bar ────────────────────────────────────────────────────
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: false,
              backgroundColor: AppTheme.surface,
              elevation: 0,
              centerTitle: false,
              titleSpacing: 16,
              title: Row(
                children: [
                  Image.asset(
                    'assets/icons/logo_aldrascan.png',
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppTheme.accentWarm.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'EXPO 2026',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.accentWarm,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.whatsapp,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chat_rounded, color: Colors.white, size: 20),
                    onPressed: () => _openWhatsApp(
                      'https://wa.me/34662078540?text=Hola,%20me%20gustaría%20recibir%20asesoramiento%20sobre%20vuestros%20productos'),
                    tooltip: 'WhatsApp',
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(height: 1, color: AppTheme.divider),
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Hero Banner rotativo ─────────────────────────────────
                  const SizedBox(height: 16),
                  _RotatingHeroBanner(
                    banners: _banners,
                    controller: _bannerController,
                    currentIndex: _bannerIndex,
                    onPageChanged: (i) => setState(() => _bannerIndex = i),
                    onCtaTap: () => _openWhatsApp(
                      'https://wa.me/34662078540?text=Hola,%20quiero%20información'),
                  ),

                  // ── Stats bar ────────────────────────────────────────────
                  const SizedBox(height: 16),
                  _StatsBar(),

                  // ── Accesos directos por categoría ───────────────────────
                  const SizedBox(height: 24),
                  const _SectionHeader(
                    title: 'Explorar por tipo',
                  ),
                  const SizedBox(height: 12),
                  _CategoriesGrid(onCategoryTap: widget.onNavigateToCatalog),

                  // ── Productos destacados ─────────────────────────────────
                  const SizedBox(height: 28),
                  const _SectionHeader(
                    title: 'Productos Destacados',
                    subtitle: 'Selección especial para Expodental',
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: featured.length,
                      itemBuilder: (ctx, i) => ProductCard(
                        product: featured[i],
                        onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: featured[i]),
                          ),
                        ),
                        onWhatsApp: () => _openWhatsApp(featured[i].whatsappUrl),
                      ),
                    ),
                  ),

                  // ── Banner Expodental final ──────────────────────────────
                  const SizedBox(height: 28),
                  _ExpoBanner(onTap: () => _openWhatsApp(
                    'https://wa.me/34662078540?text=Hola,%20me%20interesan%20las%20ofertas%20Expodental%202026')),

                  // ── WhatsApp CTA ─────────────────────────────────────────
                  const SizedBox(height: 16),
                  _WhatsAppCTA(onTap: () => _openWhatsApp(
                    'https://wa.me/34662078540?text=Hola,%20me%20gustaría%20recibir%20asesoramiento')),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Hero Banner Rotativo ──────────────────────────────────────────────────────
class _BannerData {
  final List<Color> gradient;
  final String tag;
  final String title;
  final String subtitle;
  final String cta;
  final IconData icon;

  const _BannerData({
    required this.gradient,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.cta,
    required this.icon,
  });
}

class _RotatingHeroBanner extends StatelessWidget {
  final List<_BannerData> banners;
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onCtaTap;

  const _RotatingHeroBanner({
    required this.banners,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onCtaTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            onPageChanged: onPageChanged,
            itemCount: banners.length,
            itemBuilder: (_, i) {
              final b = banners[i];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: b.gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: b.gradient.last.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Círculo decorativo
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: -30,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.04),
                        ),
                      ),
                    ),
                    // Icono grande
                    Positioned(
                      right: 20,
                      top: 0,
                      bottom: 0,
                      child: Icon(b.icon, size: 70,
                        color: Colors.white.withValues(alpha: 0.15)),
                    ),
                    // Contenido
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(b.tag,
                              style: const TextStyle(
                                color: Colors.white, fontSize: 10,
                                fontWeight: FontWeight.w700, letterSpacing: 0.3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(b.title,
                            style: const TextStyle(
                              color: Colors.white, fontSize: 22,
                              fontWeight: FontWeight.w800, height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(b.subtitle,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.80),
                              fontSize: 11, height: 1.5,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: onCtaTap,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(b.cta,
                                style: TextStyle(
                                  color: b.gradient.first,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // Indicadores
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (i) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: currentIndex == i ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: currentIndex == i ? AppTheme.primary : AppTheme.divider,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// ── Stats Bar ─────────────────────────────────────────────────────────────────
class _StatsBar extends StatelessWidget {
  final List<Map<String, String>> _stats = const [
    {'value': '+200', 'label': 'Clínicas', 'icon': '🏥'},
    {'value': '60m', 'label': 'Financiación', 'icon': '💳'},
    {'value': '24/7', 'label': 'Soporte', 'icon': '🛟'},
    {'value': '3 años', 'label': 'Garantía', 'icon': '✅'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _stats.map((s) => Column(
          children: [
            Text(s['icon']!, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 3),
            Text(s['value']!,
              style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w800,
                color: AppTheme.primary,
              ),
            ),
            Text(s['label']!,
              style: const TextStyle(
                fontSize: 10, color: AppTheme.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )).toList(),
      ),
    );
  }
}

// ── Section Header ────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const _SectionHeader({required this.title, this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!,
                    style: const TextStyle(
                      fontSize: 12, color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

// ── Categorías Grid ───────────────────────────────────────────────────────────
class _CategoriesGrid extends StatelessWidget {
  final void Function(String)? onCategoryTap;

  const _CategoriesGrid({this.onCategoryTap});

  final List<Map<String, dynamic>> _cats = const [
    {'icon': '📷', 'label': 'Escáneres',   'id': 'scanner',   'color': Color(0xFFE3F2FD)},
    {'icon': '📦', 'label': 'Packs',       'id': 'pack',      'color': Color(0xFFFFF3E0)},
    {'icon': '⚙️', 'label': 'Fresadoras',  'id': 'fresadora', 'color': Color(0xFFF3E5F5)},
    {'icon': '🔬', 'label': 'CBCT 3D',     'id': 'cbct',      'color': Color(0xFFE8F5E9)},
    {'icon': '🦷', 'label': 'Hornos',      'id': 'cadcam',    'color': Color(0xFFFCE4EC)},
    {'icon': '🪑', 'label': 'Sillones',    'id': 'sillon',    'color': Color(0xFFE0F7FA)},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.35,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _cats.length,
        itemBuilder: (_, i) {
          final cat = _cats[i];
          return GestureDetector(
            onTap: () => onCategoryTap?.call(cat['id'] as String),
            child: Container(
              decoration: BoxDecoration(
                color: (cat['color'] as Color).withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: (cat['color'] as Color),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (cat['color'] as Color).withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cat['icon'] as String,
                    style: const TextStyle(fontSize: 26)),
                  const SizedBox(height: 5),
                  Text(cat['label'] as String,
                    style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Expo Banner ───────────────────────────────────────────────────────────────
class _ExpoBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _ExpoBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF6B35), Color(0xFFFF8F00)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF6B35).withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('⚡ OFERTAS EXPO',
                      style: TextStyle(
                        color: Colors.white, fontSize: 9,
                        fontWeight: FontWeight.w800, letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Precios exclusivos\nExpodental 2026',
                    style: TextStyle(
                      color: Colors.white, fontSize: 17,
                      fontWeight: FontWeight.w800, height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('Consulta ahora →',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12, fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.local_fire_department_rounded,
              color: Colors.white, size: 56),
          ],
        ),
      ),
    );
  }
}

// ── WhatsApp CTA ──────────────────────────────────────────────────────────────
class _WhatsAppCTA extends StatelessWidget {
  final VoidCallback onTap;
  const _WhatsAppCTA({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.divider),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppTheme.whatsapp,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(Icons.chat_rounded, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('¿Necesitas asesoramiento?',
                    style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text('Respuesta inmediata por WhatsApp',
                    style: TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.whatsapp,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Chat',
                style: TextStyle(
                  color: Colors.white, fontSize: 12,
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
