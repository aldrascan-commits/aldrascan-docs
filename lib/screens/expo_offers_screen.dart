import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

// ─── Modelo de Oferta Expo ────────────────────────────────────────────────────
class ExpoOffer {
  final String id;
  final String name;
  final String subtitle;
  final String imageAsset;
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
    required this.imageAsset,
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

// ─── Datos de Ofertas Expo ────────────────────────────────────────────────────
class ExpoOffersData {
  static const List<ExpoOffer> offers = [

    // ── Escáneres ──────────────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_medit_i900',
      name: 'Medit i900',
      subtitle: 'Top de gama · Expodental precio especial',
      imageAsset: 'assets/products/medit_i900.png',
      price: 14900,
      originalPrice: 17500,
      discount: '-15%',
      financing: '60 meses · desde 248 €/mes',
      badge: '🔥 EXPO DEAL',
      badgeColor: Color(0xFFE53935),
      features: [
        '100 FPS — el más rápido del mercado',
        'Precisión 4.9 µm (clase médica)',
        'Modo inalámbrico incluido',
        'UV-C desinfección integrada',
        'Software Medit Link gratuito',
        'Formación y certificación incluidas',
      ],
      whatsappMessage:
          'Hola, me interesa el Medit i900 con la oferta Expodental 2026 (14.900€). ¿Podéis darme más información?',
      category: 'escáner',
    ),

    ExpoOffer(
      id: 'expo_medit_i700',
      name: 'Medit i700',
      subtitle: 'Velocidad profesional · Mejor precio feria',
      imageAsset: 'assets/products/medit_i700_real.png',
      price: 7900,
      originalPrice: 8500,
      discount: '-7%',
      financing: '60 meses · desde 132 €/mes',
      badge: '⭐ OFERTA EXPO',
      badgeColor: Color(0xFF1565C0),
      features: [
        '70 FPS doble velocidad',
        'Precisión 10.9 µm profesional',
        'Versión inalámbrica disponible',
        'UV-C LED desinfección',
        'Garantía 3 años oficial',
        'Instalación y formación',
      ],
      whatsappMessage:
          'Hola, me interesa el Medit i700 con la oferta Expodental 2026 (7.900€). ¿Podéis darme más información?',
      category: 'escáner',
    ),

    ExpoOffer(
      id: 'expo_medit_i600',
      name: 'Medit i600',
      subtitle: 'Entrada al digital · Precio imbatible',
      imageAsset: 'assets/products/medit_i600.png',
      price: 5500,
      originalPrice: 5900,
      discount: '-7%',
      financing: '60 meses · desde 92 €/mes',
      badge: '💙 INICIACIÓN',
      badgeColor: Color(0xFF1976D2),
      features: [
        'Velocidad 35 FPS fluida',
        'Ultraligero 245 gramos',
        'Plug & Scan sin configuración',
        'Garantía 3 años oficial',
        'Envío en 24 horas',
        'Formación clínica incluida',
      ],
      whatsappMessage:
          'Hola, me interesa el Medit i600 con la oferta Expodental 2026 (5.500€). ¿Podéis darme más información?',
      category: 'escáner',
    ),

    ExpoOffer(
      id: 'expo_aoralscan_elite',
      name: 'Aoralscan Elite',
      subtitle: 'Escáner premium · Oferta Expo exclusiva',
      imageAsset: 'assets/products/aoralscan_elite.jpg',
      price: 9900,
      originalPrice: 11500,
      discount: '-14%',
      financing: '60 meses · desde 165 €/mes',
      badge: '🏆 PREMIUM EXPO',
      badgeColor: Color(0xFF6A1B9A),
      features: [
        'Triple cámara DSLR HD',
        'Tecnología SLR avanzada',
        'Escaneo en color real',
        'Flujo completo intraoral',
        'Compatible Exocad/3Shape',
        'Soporte técnico prioritario',
      ],
      whatsappMessage:
          'Hola, me interesa el Aoralscan Elite con la oferta Expodental 2026 (9.900€). ¿Podéis darme más información?',
      category: 'escáner',
    ),

    // ── Pack Especiales ────────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_pack_pro',
      name: 'Pack AldraScan Pro',
      subtitle: 'Escáner + Fresadora + iPad · Todo incluido',
      imageAsset: 'assets/products/pack_aldrascan_pro.png',
      price: 39900,
      originalPrice: 45000,
      discount: '-11%',
      financing: '60 meses · desde 665 €/mes',
      badge: '🎁 PACK EXPO',
      badgeColor: Color(0xFF2E7D32),
      features: [
        'Medit i900 escáner intraoral',
        'Lilivis Mill LM-100 fresadora',
        'iPad Pro con software Express',
        'Formación completa certificada',
        'Instalación y puesta en marcha',
        'Garantía 3 años todo incluido',
      ],
      whatsappMessage:
          'Hola, me interesa el Pack AldraScan Pro con la oferta Expodental 2026 (39.900€). ¿Podéis darme más información?',
      category: 'pack',
    ),

    ExpoOffer(
      id: 'expo_pack_lab',
      name: 'Pack Laboratorio Digital',
      subtitle: 'Impresora + Fresadora + Horno · Lab completo',
      imageAsset: 'assets/products/pack_laboratorio_digital.png',
      price: 29900,
      originalPrice: 34500,
      discount: '-13%',
      financing: '60 meses · desde 498 €/mes',
      badge: '🏭 LAB COMPLETO',
      badgeColor: Color(0xFF00695C),
      features: [
        'Elegoo Mars 05 impresora 3D',
        'Lilivis Mill LM-100 fresadora',
        'Duotron T-3200 horno sinterización',
        'Software CAD/CAM incluido',
        'Formación técnica completa',
        'Instalación en laboratorio',
      ],
      whatsappMessage:
          'Hola, me interesa el Pack Laboratorio Digital con la oferta Expodental 2026 (29.900€). ¿Podéis darme más información?',
      category: 'pack',
    ),

    // ── CAD/CAM ────────────────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_lilivis_mill',
      name: 'Lilivis Mill LM-100',
      subtitle: 'Fresadora clínica · Precio especial Expo',
      imageAsset: 'assets/products/lilivis_mill.png',
      price: 18500,
      originalPrice: 21000,
      discount: '-12%',
      financing: '60 meses · desde 308 €/mes',
      badge: '⚙️ CAD/CAM EXPO',
      badgeColor: Color(0xFFE65100),
      features: [
        '5 ejes de alta precisión',
        'Húmedo, seco e híbrido',
        'Compatible Zirconio, PMMA, cera',
        'Ciclo rápido 15-30 min',
        'Software CAD incluido',
        'Instalación técnica incluida',
      ],
      whatsappMessage:
          'Hola, me interesa la Lilivis Mill LM-100 con la oferta Expodental 2026 (18.500€). ¿Podéis darme más información?',
      category: 'fresadora',
    ),

    ExpoOffer(
      id: 'expo_kdf_speed',
      name: 'KDF Zircom Speed',
      subtitle: 'Sinterizador ultrarrápido · 90 min ciclo',
      imageAsset: 'assets/products/kdf_speed.png',
      price: 12900,
      originalPrice: 13890,
      discount: '-7%',
      financing: '60 meses · desde 215 €/mes',
      badge: '⚡ SINTER RÁPIDO',
      badgeColor: Color(0xFF00838F),
      features: [
        'Ciclo ultrarrápido 90 minutos',
        'Temperatura máx. 1.600°C',
        'Material regalo 1.500€ incluido',
        'Compatible todas las zirconias',
        'Control automático preciso',
        'Garantía 2 años incluida',
      ],
      whatsappMessage:
          'Hola, me interesa el KDF Zircom Speed con la oferta Expodental 2026 (12.900€). ¿Podéis darme más información?',
      category: 'sinterizador',
    ),

    // ── CBCT ──────────────────────────────────────────────────────────────────
    ExpoOffer(
      id: 'expo_rayscan',
      name: 'Rayscan Alpha 3D',
      subtitle: 'CBCT multifuncional · Máxima precisión',
      imageAsset: 'assets/products/rayscan_alpha.png',
      price: 38500,
      originalPrice: 44000,
      discount: '-13%',
      financing: '60 meses · desde 642 €/mes',
      badge: '🔬 CBCT EXPO',
      badgeColor: Color(0xFF4527A0),
      features: [
        'FOV hasta 24×16 cm',
        'Resolución 0.08 mm vóxel',
        'Sensor CMOS último modelo',
        'Reconstrucción 3D en 10 seg',
        'Software implantología incluido',
        'Instalación y formación completa',
      ],
      whatsappMessage:
          'Hola, me interesa el Rayscan Alpha 3D con la oferta Expodental 2026 (38.500€). ¿Podéis darme más información?',
      category: 'cbct',
    ),
  ];

  // Categorías únicas
  static List<String> get categories {
    final cats = offers.map((o) => o.category).toSet().toList();
    cats.sort();
    return ['todos', ...cats];
  }
}

// ─── Pantalla Principal OFERTAS EXPO ─────────────────────────────────────────
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
    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
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
      backgroundColor: const Color(0xFF0A1628),
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeroBanner()),
          SliverToBoxAdapter(child: _buildCountdownStrip()),
          SliverToBoxAdapter(child: _buildCategoryFilter()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  Text(
                    '${filtered.length} ofertas exclusivas',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color(0xFFE53935).withValues(alpha: 0.5)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_fire_department,
                            color: Color(0xFFFF5252), size: 12),
                        SizedBox(width: 4),
                        Text(
                          'Solo en Expodental',
                          style: TextStyle(
                            color: Color(0xFFFF5252),
                            fontSize: 11,
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
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF6A1B9A), Color(0xFFE53935)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1565C0).withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: -30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
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
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ofertas\nExclusivas\nde Feria',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
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
                    _HeroStat(icon: Icons.percent, label: 'Hasta -15%'),
                    SizedBox(width: 16),
                    _HeroStat(
                        icon: Icons.credit_card, label: 'Hasta 60 meses'),
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

  Widget _buildCountdownStrip() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD600).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color(0xFFFFD600).withValues(alpha: 0.4)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time, color: Color(0xFFFFD600), size: 16),
          SizedBox(width: 8),
          Text(
            '⏰ Ofertas válidas solo durante el periodo de Expodental 2026',
            style: TextStyle(
              color: Color(0xFFFFD600),
              fontSize: 11,
              fontWeight: FontWeight.w600,
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
      'fresadora': '⚙️ Fresadoras',
      'sinterizador': '🔥 Sinterizadores',
      'cbct': '🔬 CBCT',
      'impresora': '🖨️ Impresoras',
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
                    : const Color(0xFF1A2540),
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
                  color: isSelected ? Colors.white : Colors.white60,
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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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

// ─── Hero Stat widget ─────────────────────────────────────────────────────────
class _HeroStat extends StatelessWidget {
  final IconData icon;
  final String label;
  const _HeroStat({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white60, size: 12),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

// ─── Tarjeta de Oferta Expo ───────────────────────────────────────────────────
class _ExpoOfferCard extends StatelessWidget {
  final ExpoOffer offer;
  final Animation<double> pulseAnimation;

  const _ExpoOfferCard({
    required this.offer,
    required this.pulseAnimation,
  });

  Future<void> _openWhatsApp() async => openUrl(offer.whatsappUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF131E35),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: offer.badgeColor.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: offer.badgeColor.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Imagen con badge ──────────────────────────────────────────────
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    offer.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF1A2540),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _categoryIcon(offer.category),
                              color: offer.badgeColor.withValues(alpha: 0.5),
                              size: 48,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              offer.name,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.4),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Badge animado
              Positioned(
                top: 12,
                left: 12,
                child: ScaleTransition(
                  scale: pulseAnimation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: offer.badgeColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: offer.badgeColor.withValues(alpha: 0.5),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Text(
                      offer.badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              // Descuento
              if (offer.discount != null)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD600),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      offer.discount!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // ── Contenido ─────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Categoría
                Text(
                  offer.category.toUpperCase(),
                  style: TextStyle(
                    color: offer.badgeColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),

                // Nombre
                Text(
                  offer.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                // Subtítulo
                Text(
                  offer.subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 14),

                // Precios
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (offer.price != null) ...[
                      Text(
                        '${offer.price!.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}€',
                        style: TextStyle(
                          color: offer.badgeColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                    const SizedBox(width: 8),
                    if (offer.originalPrice != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          '${offer.originalPrice!.toStringAsFixed(0)}€',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.3),
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),

                // Financiación
                if (offer.financing != null) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '💳 ${offer.financing}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 14),
                const Divider(color: Color(0xFF1E2D4A), height: 1),
                const SizedBox(height: 14),

                // Features
                ...offer.features.take(4).map(
                      (f) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle,
                                color: offer.badgeColor, size: 14),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                f,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                const SizedBox(height: 16),

                // Botón WhatsApp
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _openWhatsApp,
                    icon: const Icon(Icons.chat, size: 16),
                    label: const Text(
                      'Consultar oferta por WhatsApp',
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'escáner':
        return Icons.document_scanner;
      case 'pack':
        return Icons.inventory_2;
      case 'fresadora':
        return Icons.precision_manufacturing;
      case 'sinterizador':
        return Icons.whatshot;
      case 'cbct':
        return Icons.biotech;
      case 'impresora':
        return Icons.print;
      default:
        return Icons.medical_services;
    }
  }
}
