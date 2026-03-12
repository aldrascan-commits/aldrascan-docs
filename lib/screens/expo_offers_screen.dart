import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

// ─── Modelo ───────────────────────────────────────────────────────────────────
class ExpoOffer {
  final String id;
  final String name;
  final String subtitle;
  final List<String> imageAssets; // múltiples imágenes → carrusel
  final double? price;
  final double? originalPrice;
  final String? discount;
  final String? financing;
  final String badge;
  final Color badgeColor;
  final List<String> features;
  final String whatsappMessage;
  final String category;

  const ExpoOffer({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.imageAssets,
    this.price,
    this.originalPrice,
    this.discount,
    this.financing,
    required this.badge,
    required this.badgeColor,
    required this.features,
    required this.whatsappMessage,
    required this.category,
  });

  String get whatsappUrl {
    const phone = '34600000000';
    final encoded = Uri.encodeComponent(whatsappMessage);
    return 'https://wa.me/$phone?text=$encoded';
  }
}

// ─── Datos ────────────────────────────────────────────────────────────────────
class ExpoOffersData {
  static const List<ExpoOffer> offers = [

    // ── Medit i900 Mobility ────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_i900_mobility',
      name: 'Medit i900 Mobility',
      subtitle: 'Top de gama inalámbrico · iPad Pro M5 de REGALO',
      imageAssets: [
        'assets/expo/expo_medit_i900_mobility_1.png',
        'assets/expo/expo_medit_i900_mobility_2.png',
        'assets/expo/expo_medit_i900_mobility_3.png',
      ],
      price: 13900,
      discount: 'iPad Pro M5 REGALO',
      financing: '60 meses · desde 232 €/mes',
      badge: '🔥 TOP EXPO',
      badgeColor: Color(0xFFE53935),
      features: [
        '100 FPS — el más rápido del mercado',
        'Modo inalámbrico Mobility incluido',
        'iPad Pro M5 de regalo',
        'Precisión 4.9 µm',
        'UV-C desinfección integrada',
        'Formación y certificación incluidas',
      ],
      whatsappMessage:
          'Hola, me interesa el Medit i900 Mobility (13.900€ + iPad Pro M5 REGALO) de la oferta Expodental 2026. ¿Podéis darme más información?',
      category: 'escáner',
    ),

    // ── Medit i900 Classic ─────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_i900_classic',
      name: 'Medit i900 Classic',
      subtitle: 'Precisión cuando necesitas control · Portátil GRATIS',
      imageAssets: [
        'assets/expo/expo_medit_i900_classic_3.png',
        'assets/expo/expo_medit_i900_classic_1.png',
        'assets/expo/expo_medit_i900_classic_2.png',
      ],
      price: 11499,
      discount: 'Portátil GRATIS',
      financing: '60 meses · desde 192 €/mes',
      badge: '⭐ ESTRELLA EXPO',
      badgeColor: Color(0xFF1565C0),
      features: [
        '100 FPS velocidad profesional',
        'Precisión 4.9 µm clase médica',
        'Portátil de alto rendimiento GRATIS',
        'Software Medit Link incluido',
        'Garantía oficial 3 años',
        'Instalación y formación incluidas',
      ],
      whatsappMessage:
          'Hola, me interesa el Medit i900 Classic (11.499€ + Portátil GRATIS) de la oferta Expodental 2026. ¿Podéis darme más información?',
      category: 'escáner',
    ),

    // ── Shining Elite ──────────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_shining_elite',
      name: 'Shining Elite',
      subtitle: '+ Kit Scan Body incluido · Escáner premium Shining3D',
      imageAssets: [
        'assets/expo/expo_shining_elite_1.png',
        'assets/expo/expo_shining_elite_2.png',
      ],
      price: 16200,
      discount: 'Kit Scan Body',
      financing: '60 meses · desde 270 €/mes',
      badge: '🏆 PREMIUM',
      badgeColor: Color(0xFF6A1B9A),
      features: [
        'Escáner intraoral Shining3D Elite',
        'Kit Scan Body incluido de regalo',
        'Alta precisión implantología',
        'Compatible Exocad / 3Shape',
        'Flujo completo digital',
        'Soporte técnico prioritario',
      ],
      whatsappMessage:
          'Hola, me interesa el Shining Elite (16.200€ + Kit Scan Body) de la oferta Expodental 2026. ¿Podéis darme más información?',
      category: 'escáner',
    ),

    // ── Aoralscan Elf ──────────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_aoralscan_elf',
      name: 'Aoralscan Elf',
      subtitle: 'Escáner Premium · 106g ultraligero · USB-C simple',
      imageAssets: [
        'assets/expo/expo_aoralscan_elf.png',
      ],
      price: 9900,
      financing: '60 meses · desde 165 €/mes',
      badge: '💎 ULTRA LIGERO',
      badgeColor: Color(0xFF00838F),
      features: [
        '106 g — el más ligero de su clase',
        'USB-C plug & play sin PC dedicado',
        'Ergonomía perfecta en mano',
        'Precisión de escáner premium',
        'Expodental 2026 precio especial',
        'Formación técnica incluida',
      ],
      whatsappMessage:
          'Hola, me interesa el Aoralscan Elf (9.900€) de la oferta Expodental 2026. ¿Podéis darme más información?',
      category: 'escáner',
    ),

    // ── AldraScan Pro (pack clínica día completo) ──────────────────────────────
    ExpoOffer(
      id: 'expo_aldrascan_pro',
      name: 'AldraScan Pro',
      subtitle: 'Diagnóstico · Escaneo · Restauración — Todo en el mismo día',
      imageAssets: [
        'assets/expo/expo_aldrascan_pro_1.png',
        'assets/expo/expo_aldrascan_pro_2.png',
        'assets/expo/expo_aldrascan_pro_3.png',
      ],
      price: 29900,
      discount: 'Desde',
      financing: '60 meses · desde 498 €/mes',
      badge: '🎁 PACK CLÍNICA',
      badgeColor: Color(0xFF2E7D32),
      features: [
        'Escáner intraoral Medit incluido',
        'Fresadora clínica CAD/CAM',
        'Software ClinicCAD incluido',
        'Todo en el mismo día',
        'Instalación y puesta en marcha',
        'Formación completa certificada',
      ],
      whatsappMessage:
          'Hola, me interesa el Pack AldraScan Pro (desde 29.900€) de la oferta Expodental 2026. ¿Podéis darme más información?',
      category: 'pack',
    ),

    // ── Oferta Financiación Exclusiva ──────────────────────────────────────────
    ExpoOffer(
      id: 'expo_financiacion',
      name: 'Financiación Exclusiva',
      subtitle: 'Empieza a producir hoy · Paga dentro de 90 días',
      imageAssets: [
        'assets/expo/expo_financiacion.png',
      ],
      financing: '3 meses de carencia inicial',
      badge: '💳 COLEGIADOS',
      badgeColor: Color(0xFFB8860B),
      features: [
        'Financiación preferente para colegiados',
        '3 meses de carencia inicial',
        'Empieza a producir antes de pagar',
        'Tecnología de alta precisión',
        'Condiciones exclusivas Expodental',
        'Consulta condiciones sin compromiso',
      ],
      whatsappMessage:
          'Hola, me interesa la oferta de financiación exclusiva para colegiados (3 meses de carencia). ¿Podéis darme más información?',
      category: 'financiación',
    ),

    // ── KDF Zircom – Fresadoras CAD/CAM ───────────────────────────────────────
    ExpoOffer(
      id: 'expo_kdf_zircom',
      name: 'KDF Zircom · Fresadoras CAD/CAM',
      subtitle: 'Standard · Speed · Plus — Producción propia en clínica',
      imageAssets: [
        'assets/expo/expo_kdf_standard.png',
        'assets/expo/expo_kdf_speed.png',
        'assets/expo/expo_kdf_plus.png',
      ],
      price: 12900,
      discount: 'Desde',
      financing: '60 meses · desde 215 €/mes',
      badge: '⚙️ CAD/CAM',
      badgeColor: Color(0xFF37474F),
      features: [
        'KDF Zircom Standard · Speed · Plus',
        'Fresado húmedo y seco disponible',
        'Compatible Exocad / 3Shape',
        'Software CAD incluido',
        'Instalación y formación en clínica',
        'Garantía oficial KDF',
      ],
      whatsappMessage:
          'Hola, me interesan las fresadoras KDF Zircom (desde 12.900€) de la oferta Expodental 2026. ¿Podéis darme más información?',
      category: 'fresadora',
    ),

    // ── Galería Expo – imágenes adicionales ────────────────────────────────────
    ExpoOffer(
      id: 'expo_galeria',
      name: 'Más Ofertas Expodental',
      subtitle: 'Descubre toda la gama · Tecnología dental de vanguardia',
      imageAssets: [
        'assets/expo/expo_img_01.webp',
        'assets/expo/expo_img_02.webp',
        'assets/expo/expo_img_03.webp',
        'assets/expo/expo_img_04.webp',
        'assets/expo/expo_img_05.webp',
        'assets/expo/expo_img_06.webp',
        'assets/expo/expo_img_07.webp',
        'assets/expo/expo_img_08.webp',
      ],
      financing: '60 meses · financiación disponible',
      badge: '📸 GALERÍA EXPO',
      badgeColor: Color(0xFF1565C0),
      features: [
        'Toda la gama AldraScan Expodental',
        'Precios especiales de feria',
        'Financiación hasta 60 meses',
        'Instalación y formación incluidas',
        'Soporte técnico 24/7',
        'Más de 200 clínicas digitalizadas',
      ],
      whatsappMessage:
          'Hola, he visto las ofertas Expodental 2026 en el catálogo AldraScan. ¿Podéis darme más información?',
      category: 'galería',
    ),
  ];

  static List<String> get categories {
    final cats = offers.map((o) => o.category).toSet().toList();
    return ['todos', ...cats];
  }
}

// ─── Pantalla Principal ───────────────────────────────────────────────────────
class ExpoOffersScreen extends StatefulWidget {
  const ExpoOffersScreen({super.key});

  @override
  State<ExpoOffersScreen> createState() => _ExpoOffersScreenState();
}

class _ExpoOffersScreenState extends State<ExpoOffersScreen>
    with SingleTickerProviderStateMixin {
  String _selectedCategory = 'todos';
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  List<ExpoOffer> get _filtered {
    if (_selectedCategory == 'todos') return ExpoOffersData.offers;
    return ExpoOffersData.offers
        .where((o) => o.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    return Scaffold(
      backgroundColor: const Color(0xFF081525),
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeroBanner()),
          SliverToBoxAdapter(child: _buildAlertStrip()),
          SliverToBoxAdapter(child: _buildCategoryFilter()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  Text(
                    '${filtered.length} ofertas exclusivas',
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 12),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              const Color(0xFFE53935).withValues(alpha: 0.4)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_fire_department,
                            color: Color(0xFFFF5252), size: 11),
                        SizedBox(width: 4),
                        Text(
                          'Solo en Expodental',
                          style: TextStyle(
                            color: Color(0xFFFF5252),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _ExpoOfferCard(
                    offer: filtered[i],
                    pulseAnimation: _pulseAnimation,
                  ),
                ),
                childCount: filtered.length,
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildBottomBanner()),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD600), size: 20),
          SizedBox(width: 8),
          Text(
            'OFERTAS EXPO',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF0D1F3C),
      foregroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.1)),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D47A1), Color(0xFF6A1B9A), Color(0xFFB71C1C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1565C0).withValues(alpha: 0.4),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            top: -24,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD600),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '⚡ EXPODENTAL 2026',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ofertas\nExclusivas\nde Feria',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Precios especiales solo disponibles\ndurante Expodental 2026',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    _HeroStat(icon: Icons.card_giftcard, label: 'Regalos incluidos'),
                    SizedBox(width: 16),
                    _HeroStat(icon: Icons.credit_card, label: 'Hasta 60 meses'),
                    SizedBox(width: 16),
                    _HeroStat(icon: Icons.school, label: 'Formación gratis'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertStrip() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD600).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color(0xFFFFD600).withValues(alpha: 0.35)),
      ),
      child: const Row(
        children: [
          Icon(Icons.access_time_rounded,
              color: Color(0xFFFFD600), size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '⏰ Ofertas válidas solo durante el periodo de Expodental 2026',
              style: TextStyle(
                color: Color(0xFFFFD600),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final categories = ExpoOffersData.categories;
    final labels = {
      'todos': '🌟 Todos',
      'escáner': '📷 Escáneres',
      'pack': '📦 Packs',
      'fresadora': '⚙️ CAD/CAM',
      'financiación': '💳 Financiación',
      'galería': '📸 Galería',
    };

    return Container(
      height: 44,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (ctx, i) {
          final cat = categories[i];
          final isSelected = _selectedCategory == cat;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = cat),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF1565C0)
                    : const Color(0xFF152035),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF1565C0)
                      : Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Text(
                labels[cat] ?? cat,
                style: TextStyle(
                  color:
                      isSelected ? Colors.white : Colors.white54,
                  fontSize: 12,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.headset_mic,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Necesitas asesoramiento?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Nuestros expertos te ayudan a elegir\nel equipo ideal para tu clínica.',
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

// ─── Hero Stat ────────────────────────────────────────────────────────────────
class _HeroStat extends StatelessWidget {
  final IconData icon;
  final String label;
  const _HeroStat({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 12),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(color: Colors.white54, fontSize: 10)),
      ],
    );
  }
}

// ─── Tarjeta con carrusel ─────────────────────────────────────────────────────
class _ExpoOfferCard extends StatefulWidget {
  final ExpoOffer offer;
  final Animation<double> pulseAnimation;

  const _ExpoOfferCard(
      {required this.offer, required this.pulseAnimation});

  @override
  State<_ExpoOfferCard> createState() => _ExpoOfferCardState();
}

class _ExpoOfferCardState extends State<_ExpoOfferCard> {
  int _currentImage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _openWhatsApp() async =>
      openUrl(widget.offer.whatsappUrl);

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;
    final hasMultiple = offer.imageAssets.length > 1;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF081525),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Imagen 100% (cuadrada 1:1) con carrusel ──────────────────────
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: hasMultiple
                      ? PageView.builder(
                          controller: _pageController,
                          itemCount: offer.imageAssets.length,
                          onPageChanged: (i) =>
                              setState(() => _currentImage = i),
                          itemBuilder: (ctx, i) =>
                              _buildImage(offer.imageAssets[i], offer),
                        )
                      : _buildImage(offer.imageAssets[0], offer),
                ),
                // Puntos de paginación solo si hay múltiples imágenes
                if (hasMultiple)
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        offer.imageAssets.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _currentImage == i ? 20 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: _currentImage == i
                                ? Colors.white
                                : Colors.white38,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // ── Solo botón WhatsApp ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openWhatsApp,
                icon: const Icon(Icons.chat_rounded, size: 16),
                label: const Text(
                  'Consultar por WhatsApp',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String asset, ExpoOffer offer) {
    return Image.asset(
      asset,
      width: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => Container(
        width: double.infinity,
        height: 220,
        color: const Color(0xFF152035),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_not_supported_outlined,
                  color: offer.badgeColor.withValues(alpha: 0.4), size: 40),
              const SizedBox(height: 8),
              Text(offer.name,
                  style: const TextStyle(
                      color: Colors.white38, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}
