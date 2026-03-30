import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Pack AldraScan Pro Screen — Fiel al estilo premium oscuro del PDF oficial
// ─────────────────────────────────────────────────────────────────────────────

class PackAldrascanProScreen extends StatefulWidget {
  const PackAldrascanProScreen({super.key});

  @override
  State<PackAldrascanProScreen> createState() => _PackAldrascanProScreenState();
}

class _PackAldrascanProScreenState extends State<PackAldrascanProScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeIn;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  int _activeWorkflowCard = 0;
  int _roiScenario = 1; // 0=conservador, 1=medio, 2=alto

  // ── Paleta exacta del PDF ─────────────────────────────────────────────────
  static const Color _bg = Color(0xFF000000);
  static const Color _cardBg = Color(0xFF0D1118);
  static const Color _cardBorder = Color(0xFF1E2530);
  static const Color _blue = Color(0xFF0080FF);
  static const Color _blueDark = Color(0xFF1E3A5F);
  static const Color _teal = Color(0xFF00B4D8);
  static const Color _green = Color(0xFF22C55E);
  static const Color _greenDark = Color(0xFF1A4A2A);
  static const Color _amber = Color(0xFFF59E0B);
  static const Color _red = Color(0xFFCC2200);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _gray = Color(0xFF8090A8);
  static const Color _grayLight = Color(0xFFB0B8C8);
  static const Color _grayDark = Color(0xFF404050);
  static const Color _numBig = Color(0xFF2A3040);

  @override
  void initState() {
    super.initState();
    _fadeIn = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fade = CurvedAnimation(parent: _fadeIn, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.04), end: Offset.zero)
        .animate(CurvedAnimation(parent: _fadeIn, curve: Curves.easeOutCubic));
    _fadeIn.forward();
  }

  @override
  void dispose() {
    _fadeIn.dispose();
    super.dispose();
  }

  void _openWhatsApp(String msg) {
    final enc = Uri.encodeComponent(msg);
    openUrl('https://wa.me/34662078540?text=$enc');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: CustomScrollView(
            slivers: [
              // ── SLIDE 1: Portada Hero ────────────────────────────────────
              SliverToBoxAdapter(child: _slideHero()),
              // ── SLIDE 2: Workflow Digital ────────────────────────────────
              SliverToBoxAdapter(child: _slideWorkflow()),
              // ── SLIDE 3: Medit i900 Mobility ────────────────────────────
              SliverToBoxAdapter(child: _slideMeditScanner()),
              // ── SLIDE 4: ClinicCAD Software ─────────────────────────────
              SliverToBoxAdapter(child: _slideClinicCAD()),
              // ── SLIDE 5: Lilivis Mill ────────────────────────────────────
              SliverToBoxAdapter(child: _slideLilivisMill()),
              // ── SLIDE 6: Pack Laboratorio Digital ───────────────────────
              SliverToBoxAdapter(child: _slidePackLab()),
              // ── SLIDE 7: ROI Real España 2026 ───────────────────────────
              SliverToBoxAdapter(child: _slideROI()),
              // ── SLIDE 8: Versatilidad 3D ─────────────────────────────────
              SliverToBoxAdapter(child: _slideVersatilidad3D()),
              // ── SLIDE 9: Oferta Limitada / Pricing ──────────────────────
              SliverToBoxAdapter(child: _slideOfertaLimitada()),
              // ── SLIDE 10: Materiales & Acabado ──────────────────────────
              SliverToBoxAdapter(child: _slideMateriales()),
              // ── CTA Final ────────────────────────────────────────────────
              SliverToBoxAdapter(child: _slideCTAFinal()),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
        ),
      ),
      floatingActionButton: _fab(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 1 — PORTADA HERO
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideHero() {
    return Container(
      color: _bg,
      child: Column(
        children: [
          // App bar minimal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios, color: _white, size: 20),
                  const Spacer(),
                  _badgePill('● OFERTA LIMITADA', _blue, dotted: true),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _openWhatsApp('Hola, me interesa el Pack AldraScan Pro.'),
                    child: const Icon(Icons.chat_bubble_outline, color: _blue, size: 22),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          // Título hero
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Pack AldraScan Pro',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _white,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.0,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'La nueva era de la odontología digital',
            textAlign: TextAlign.center,
            style: TextStyle(color: _grayLight, fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 6),
          const Text(
            'CHAIRSIDE & LAB ECOSYSTEM',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _blue,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          // Logo AldraScan
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/logo_aldrascan.png',
                height: 32,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Text(
                  'AldraScan',
                  style: TextStyle(color: _white, fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(width: 8),
              const Text('🦷✨', style: TextStyle(fontSize: 22)),
            ],
          ),
          const SizedBox(height: 56),
          // Footer
          const Divider(color: _grayDark, height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              children: const [
                Text('Designed for Excellence', style: TextStyle(color: _grayDark, fontSize: 10)),
                Spacer(),
                Text('Precisión • Velocidad • Rentabilidad', style: TextStyle(color: _grayDark, fontSize: 10)),
                Spacer(),
                Text('2026 Edition', style: TextStyle(color: _grayDark, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 2 — WORKFLOW DIGITAL COMPLETO
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideWorkflow() {
    final cards = [
      _WFCard(
        badge: 'ESCANEO', num: '01',
        product: 'Medit i900 Mobility',
        time: '3-5 min',
        bullets: ['Wi-Fi 6E ultrarrápido', '3 baterías incluidas', 'Precisión 10.9 μm'],
        image: 'assets/products/medit_i900_mobility_real.png',
        color: _blue,
      ),
      _WFCard(
        badge: 'DISEÑO', num: '02',
        product: 'ClinicCAD con IA',
        time: '5-8 min',
        bullets: ['AI Modeling auto', 'Interfaz simplificada', 'Exportación directa'],
        image: 'assets/products/cliniccad_logo.png',
        color: _blue,
      ),
      _WFCard(
        badge: 'PRODUCCIÓN', num: '03',
        product: 'Lilivis Mill\n(Dual 3-Axis)',
        time: '8-15 min',
        bullets: ['50,000 RPM potencia', 'Repetibilidad ±25 μm', 'Multi-Material'],
        image: 'assets/products/lilivis_mill.png',
        color: _blue,
      ),
      _WFCard(
        badge: 'COCCIÓN', num: '04',
        product: 'Duotron Series',
        time: '2-4h',
        bullets: ['Hasta 1,600°C temp', 'Ciclos std 2-4 horas', 'Cerámicas MAZIC'],
        image: 'assets/products/duotron_t5200.png',
        color: _blue,
      ),
    ];

    return _slideWrapper(
      sectionLabel: 'ECOSISTEMA',
      title: 'Workflow Digital Completo',
      subtitle: 'De la impresión digital a la colocación. Todo en tu clínica.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Selector de tarjetas
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(cards.length, (i) {
                final active = _activeWorkflowCard == i;
                return GestureDetector(
                  onTap: () => setState(() => _activeWorkflowCard = i),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: active ? _blue : _cardBg,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: active ? _blue : _cardBorder),
                    ),
                    child: Text(
                      cards[i].badge,
                      style: TextStyle(
                        color: active ? _white : _blue,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          // Tarjeta activa
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildWFCard(cards[_activeWorkflowCard]),
          ),
          const SizedBox(height: 20),
          // Fila de todas en scroll horizontal
          SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              separatorBuilder: (_, __) => Row(
                children: [
                  const SizedBox(width: 8),
                  Text('›', style: TextStyle(color: _cardBorder, fontSize: 24)),
                  const SizedBox(width: 8),
                ],
              ),
              itemBuilder: (_, i) => _buildWFCardMini(cards[i], i == _activeWorkflowCard),
            ),
          ),
          const SizedBox(height: 20),
          // Footer tiempo total
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _cardBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _cardBorder),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('TIEMPO TOTAL DE PROCESO',
                        style: TextStyle(color: _gray, fontSize: 9, letterSpacing: 1)),
                    SizedBox(height: 2),
                    Text('~1 a 4 horas',
                        style: TextStyle(color: _white, fontSize: 22, fontWeight: FontWeight.w900)),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: _greenDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.check_circle, color: _green, size: 14),
                      SizedBox(width: 6),
                      Text('Tratamiento completo\nen una sola visita',
                          style: TextStyle(color: _white, fontSize: 11, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWFCard(_WFCard c) {
    return Container(
      key: ValueKey(c.badge),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen + badge
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 90, height: 90,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(c.image, fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(Icons.devices, color: _blue, size: 40)),
                    ),
                  ),
                  Positioned(
                    top: 0, left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: _blue.withValues(alpha: 0.15),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(8)),
                      ),
                      child: Text(c.badge, style: const TextStyle(color: _blue, fontSize: 8, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _timeBadge(c.time),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Número grande detrás
                Stack(
                  children: [
                    Positioned(
                      right: 0, top: -10,
                      child: Text(c.num, style: const TextStyle(color: _numBig, fontSize: 52, fontWeight: FontWeight.w900)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(c.product,
                            style: const TextStyle(color: _white, fontSize: 16, fontWeight: FontWeight.w700, height: 1.2)),
                        const SizedBox(height: 12),
                        ...c.bullets.map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Container(width: 4, height: 4,
                                  decoration: const BoxDecoration(color: _gray, shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              Text(b, style: const TextStyle(color: _gray, fontSize: 12)),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWFCardMini(_WFCard c, bool active) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: active ? _blue.withValues(alpha: 0.12) : _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: active ? _blue : _cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(c.badge, style: const TextStyle(color: _blue, fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
          const SizedBox(height: 6),
          Expanded(
            child: Center(
              child: Image.asset(c.image, fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(Icons.devices, color: _blue, size: 36)),
            ),
          ),
          const SizedBox(height: 6),
          Text(c.product, style: const TextStyle(color: _white, fontSize: 11, fontWeight: FontWeight.w700), maxLines: 2),
          const SizedBox(height: 4),
          _timeBadge(c.time),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 3 — MEDIT i900 MOBILITY
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideMeditScanner() {
    return Container(
      color: _bg,
      child: Row(
        children: [
          // Barra vertical azul izquierda
          Container(width: 3, height: 380, color: _blue),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 20, 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Columna imagen
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'assets/products/panda_smart_ipad.png',
                      height: 300,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/products/medit_i900_mobility_real.png',
                        height: 260, fit: BoxFit.contain,
                        errorBuilder: (__, ___, ____) => const Icon(Icons.sensors, color: _blue, size: 80),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Columna texto
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('MEDIT I900 MOBILITY',
                            style: TextStyle(color: _blue, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                        const SizedBox(height: 10),
                        const Text('La ligereza\ndel futuro.',
                            style: TextStyle(color: _white, fontSize: 30, fontWeight: FontWeight.w900, height: 1.1)),
                        const SizedBox(height: 12),
                        const Text(
                          'Experimenta la verdadera libertad con un escaneo inalámbrico que redefine la ergonomía. Potencia clínica en la palma de tu mano.',
                          style: TextStyle(color: _grayLight, fontSize: 13, height: 1.6),
                        ),
                        const SizedBox(height: 20),
                        // Grid 2x2 features
                        _feature2x2([
                          _FeatureItem(Icons.wifi, 'Wi-Fi 6E', 'Conectividad ultrarrápida y estable sin cables.'),
                          _FeatureItem(Icons.tablet_mac, 'iPad Nativo', 'Escanea directamente con Medit Link Express.'),
                          _FeatureItem(Icons.air, '242g Ultra-ligero', 'El scanner inalámbrico más liviano del mercado.'),
                          _FeatureItem(Icons.battery_full, 'All-Day Battery', 'Energía inteligente para sesiones continuas.'),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 4 — CLINICCAD SOFTWARE
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideClinicCAD() {
    return Container(
      color: _bg,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CLINICCAD SOFTWARE',
                        style: TextStyle(color: _blue, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                    const SizedBox(height: 8),
                    const Text('Diseño intuitivo.\nControl total.',
                        style: TextStyle(color: _white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.1)),
                    const SizedBox(height: 10),
                    const Text(
                      'IA que transforma escaneos en restauraciones listas para producir. Sin curvas de aprendizaje complejas.',
                      style: TextStyle(color: _gray, fontSize: 12, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    // 4 features en fila
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _featureInline(Icons.psychology, 'AI Modeling', 'Diseño auto.'),
                          const SizedBox(width: 20),
                          _featureInline(Icons.health_and_safety, 'Chairside', 'Flujo rápido.'),
                          const SizedBox(width: 20),
                          _featureInline(Icons.tune, 'Edit Tools', 'Ajuste fino.'),
                          const SizedBox(width: 20),
                          _featureInline(Icons.open_in_new, 'Open Sys', 'Export STL/OBJ.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Logo ClinicCAD
              Container(
                width: 110, height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/products/cliniccad_logo.png', fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(Icons.health_and_safety, color: _blue, size: 60)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Separador azul
          Container(height: 1, color: _blue.withValues(alpha: 0.5)),
          const SizedBox(height: 20),
          // Medit Apps Ecosistema AI
          Row(
            children: [
              const Text('MEDIT APPS ', style: TextStyle(color: _white, fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
              const Text('ECOSISTEMA AI', style: TextStyle(color: _blue, fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 14),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _appCard('assets/products/denticion_modelo.png', 'Ortho Simulator', 'Simulación visual de movimiento dental.'),
              _appCard('assets/products/modelo_3d_dental.png', 'Smile Design', 'Diseño de sonrisa interactivo 2D/3D.'),
              _appCard('assets/products/protesis_completa.png', 'Crown Fit', 'Ajuste digital preciso de prótesis.'),
              _appCard('assets/products/medit_i900_classic.png', 'Model Builder', 'Modelos listos para impresión 3D.'),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 5 — LILIVIS MILL
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideLilivisMill() {
    return Container(
      color: _bg,
      child: Row(
        children: [
          Container(width: 3, height: 400, color: _blue),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 20, 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        'assets/products/lilivis_mill.png',
                        height: 260, fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(Icons.precision_manufacturing, color: _blue, size: 80),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('LILIVIS MILL',
                            style: TextStyle(color: _blue, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                        const SizedBox(height: 8),
                        const Text('Precisión en\ncada micra.',
                            style: TextStyle(color: _white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.1)),
                        const SizedBox(height: 12),
                        const Text(
                          'Rompa la dependencia de laboratorios externos. Producción chairside de alta fidelidad con tecnología Dual 3-Axis que transforma su clínica en un centro de manufactura autónomo.',
                          style: TextStyle(color: _grayLight, fontSize: 12, height: 1.6),
                        ),
                        const SizedBox(height: 18),
                        _feature2x2([
                          _FeatureItem(Icons.memory, 'Dual Spindles', 'Sistema Dual 3-Axis con 4 motores a 50,000 rpm.'),
                          _FeatureItem(Icons.schedule, 'One-Day Dentistry', 'De escaneo a colocación en una sola visita.'),
                          _FeatureItem(Icons.water_drop, 'Wet Processing', 'Fresado húmedo con precisión de ±25μm.'),
                          _FeatureItem(Icons.layers, 'Multi-Material', 'Versatilidad: Zirconia, PMMA, Cerámica, Disilicato.'),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 6 — PACK LABORATORIO DIGITAL
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slidePackLab() {
    return _slideWrapper(
      noLabel: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge + título
          _badgePill('OFERTA LIMITADA', _red),
          const SizedBox(height: 12),
          Row(
            children: const [
              Text('Pack Laboratorio ', style: TextStyle(color: _white, fontSize: 26, fontWeight: FontWeight.w900)),
              Text('Digital', style: TextStyle(color: _blue, fontSize: 26, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 20),
          // Tarjeta Fresado
          _labCard(
            image: 'assets/products/lilivis_mill.png',
            badgeText: 'FRESADO', badgeColor: _blue,
            title: 'Lilivis Mill - Dual 3-Axis',
            desc: 'Fresadora Dual 3-Axis chairside de alta precisión. Producción interna con 4 motores y dual spindles a 50,000 rpm.',
            checks: ['Dual 3-Axis System', 'Dual Spindles 50,000 RPM'],
          ),
          const SizedBox(height: 12),
          // Tarjeta Cocción
          _labCard(
            image: 'assets/products/duotron_t5200.png',
            badgeText: 'COCCIÓN', badgeColor: _amber,
            title: 'Duotron Series',
            desc: 'Horno de cocción y cristalizado para cerámicas de disilicato de litio. Control térmico preciso para resultados estéticos perfectos.',
            checks: ['Ciclos 2-4 horas', '1,600°C Temp. Máxima'],
          ),
          const SizedBox(height: 16),
          // Footer badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: _greenDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.check_circle, color: _green, size: 14),
                SizedBox(width: 8),
                Text('De depender de terceros... a producir internamente.',
                    style: TextStyle(color: _white, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 7 — ROI REAL ESPAÑA 2026
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideROI() {
    final labels = ['Conservador', 'Medio\n(Recomendado)', 'Alto Volumen'];
    final roiData = [
      // [mes, conservador, medio, alto]
      [1, -35.0, -30.0, -25.0],
      [3, -25.0, -15.0, -5.0],
      [6, -10.0, 5.0, 20.0],
      [8, 0.0, 15.0, 35.0],
      [10, 10.0, 28.0, 50.0],
      [12, 20.0, 42.0, 65.0],
    ];

    return _slideWrapper(
      sectionLabel: 'ANÁLISIS FINANCIERO',
      title: 'ROI Real España 2026',
      subtitle: 'Métricas de Margen Reales — Producción Interna vs Mercado',
      trailing: _badgePill('● Precios de Mercado Verificados', _green, small: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gráfico simplificado
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _cardBg, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ROI Pack AldraScan Pro',
                            style: TextStyle(color: _white, fontSize: 13, fontWeight: FontWeight.w700)),
                        const Text('Inv. 39.900€  ·  Proyección 12 Meses (Beneficio Neto)',
                            style: TextStyle(color: _gray, fontSize: 10)),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 12),
                // Selector escenario
                Row(
                  children: List.generate(3, (i) => GestureDetector(
                    onTap: () => setState(() => _roiScenario = i),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 12, height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: _roiScenario == i ? _blue : _gray, width: 2),
                              color: _roiScenario == i ? _blue : Colors.transparent,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(labels[i].replaceAll('\n', ' '),
                              style: TextStyle(
                                  color: _roiScenario == i ? _white : _gray,
                                  fontSize: 10,
                                  fontWeight: _roiScenario == i ? FontWeight.w600 : FontWeight.w400)),
                        ],
                      ),
                    ),
                  )),
                ),
                const SizedBox(height: 12),
                // Gráfico visual simplificado con barras
                SizedBox(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: roiData.map((d) {
                      final val = d[_roiScenario + 1] as double;
                      final normalized = ((val + 40) / 110).clamp(0.0, 1.0);
                      final isNeg = val < 0;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                val >= 0 ? '+${val.toInt()}k' : '${val.toInt()}k',
                                style: TextStyle(
                                    color: isNeg ? _gray : _green, fontSize: 8, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 2),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: (normalized * 70).clamp(4.0, 70.0),
                                decoration: BoxDecoration(
                                  color: isNeg
                                      ? _gray.withValues(alpha: 0.3)
                                      : [_white.withValues(alpha: 0.3), _blue.withValues(alpha: 0.7), _green.withValues(alpha: 0.8)][_roiScenario],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text('M${d[0].toInt()}', style: const TextStyle(color: _gray, fontSize: 8)),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(height: 1, width: 20, color: _gray),
                    const SizedBox(width: 4),
                    const Text('Break Even (0€)', style: TextStyle(color: _gray, fontSize: 9)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 3 tarjetas métricas
          Row(
            children: [
              Expanded(child: _metricCard('🦷', 'PRODUCCIÓN INTERNA', _blue, 'Ahorro Neto\npor Corona', '80€',
                  ['Precio paciente: 350€', 'Ahorro lab: 90€/ud', 'Coste bloque: 10€', 'Margen real: 80€'])),
              const SizedBox(width: 10),
              Expanded(child: _metricCard('💎', 'ALTO VALOR', _green, 'Ahorro Neto\npor Carilla', '108€',
                  ['Precio paciente: 450€', 'Ahorro lab: 120€/ud', 'Coste bloque: 12€', 'Margen real: 108€'])),
              const SizedBox(width: 10),
              Expanded(child: _metricCard('📈', 'RETORNO INVERSIÓN', _teal, 'Break\nEven Real', 'Mes\n7-8',
                  ['Escenario Medio:', '25 coronas +', '15 carillas/mes', 'Neto: 5.620€/mes'])),
            ],
          ),
          const SizedBox(height: 16),
          // Banner footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _greenDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('✓  Escenario medio: 25 coronas + 15 carillas/mes = Break Even mes 7-8',
                    style: TextStyle(color: _white, fontSize: 11)),
                SizedBox(height: 4),
                Text('•  ROI 3 años: +265% (67.440€ beneficio neto acumulado)',
                    style: TextStyle(color: _green, fontSize: 11, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 8 — VERSATILIDAD 3D
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideVersatilidad3D() {
    return _slideWrapper(
      sectionLabel: 'FABRICACIÓN ADITIVA',
      title: 'Versatilidad 3D',
      subtitle: 'De la planificación quirúrgica a la prótesis final.',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Columna impresora
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const Text('Elegoo Mars',
                    style: TextStyle(color: _white, fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                const Text('Precisión SLA/DLP 4K para uso dental',
                    style: TextStyle(color: _gray, fontSize: 11)),
                const SizedBox(height: 12),
                Image.asset('assets/products/elegoo_mars5.png',
                    height: 180, fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(Icons.print, color: _gray, size: 80)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _specBadge('↕ 35 μm'),
                    const SizedBox(width: 10),
                    _specBadge('⚡ 1.5 s'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('ODONTOLOGÍA DIGITAL PREMIUM',
                    style: TextStyle(color: _grayDark, fontSize: 8, letterSpacing: 1)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Columna aplicaciones
          Expanded(
            flex: 5,
            child: Column(
              children: [
                _app3DCard(
                  'assets/products/férula_dental.png',
                  'APLICACIÓN DESTACADA', _blue,
                  'Férulas de Descarga',
                  'ORTODONCIA & ATM', _blue,
                  'Ajuste oclusal perfecto con resinas biocompatibles. Flujo digital 100% libre de yeso.',
                ),
                const SizedBox(height: 10),
                _app3DCard(
                  'assets/products/denticion_modelo.png',
                  'DIAGNÓSTICO', _teal,
                  'Modelos de Precisión',
                  'PLANIFICACIÓN', _teal,
                  'Verificación de ajuste y planificación quirúrgica. Impresión rápida para mockups y guías.',
                ),
                const SizedBox(height: 10),
                _app3DCard(
                  'assets/products/protesis_completa.png',
                  'REMOVIBLE', _gray,
                  'Prótesis Totales',
                  'ESTÉTICA', _grayLight,
                  'Bases estéticas realistas con encía texturizada. Prueba de monobloque en una sola sesión.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 9 — OFERTA LIMITADA / PRICING
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideOfertaLimitada() {
    return Container(
      color: _bg,
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              _badgePill('EXPO EXCLUSIVE', _blue),
              const SizedBox(width: 10),
              const Text('OFERTA VÁLIDA SOLO DURANTE EL EVENTO',
                  style: TextStyle(color: _grayLight, fontSize: 10, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 10),
          const Text('OFERTA LIMITADA',
              style: TextStyle(color: _white, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
          const SizedBox(height: 20),
          // Card Pack AldraScan Pro
          _pricingCard(
            badgeCard: 'ECOSISTEMA CLÍNICO',
            badgeCardColor: _blueDark,
            stockBadge: null,
            title: 'Pack AldraScan Pro',
            subtitle: 'La solución definitiva para el flujo chairside.',
            originalPrice: '48.500€',
            savings: 'AHORRAS 8.600€',
            items: [
              'Medit i900 Mobility Wireless',
              'ClinicCAD (Licencia Perpetua)',
              'Lilivis Mill (Dual 3-Axis)',
              'L-CAM (Licencia Perpetua)',
              'iPad Pro 13"',
              'Kit Materiales Completo',
              'Instalación y Formación Clínica',
            ],
            note: '⚠  Horno de sinterizado vendido separadamente (+10.000€)',
            priceLabel: 'INVERSIÓN ÚNICA',
            finalPrice: '39.900 €',
            discount: '-18%',
            priceNote: '+ IVA (Incluye instalación)',
            ctaText: 'RESERVAR',
            onCta: () => _openWhatsApp(
                'Hola, quiero reservar el Pack AldraScan Pro (39.900€ + IVA) oferta Expodental 2026. ¿Podéis contactarme?'),
          ),
          const SizedBox(height: 14),
          // Card Pack Laboratorio
          _pricingCard(
            badgeCard: 'PRODUCCIÓN IN-HOUSE',
            badgeCardColor: const Color(0xFF1A2535),
            stockBadge: '⚠ STOCK LIMITADO',
            title: 'Pack Laboratorio',
            subtitle: 'Control total de la producción digital.',
            originalPrice: '38.000€',
            savings: 'AHORRAS 8.100€',
            items: [
              'Lilivis Mill (Dual 3-Axis)',
              'Horno de Cocción/Cristalizado (Duotron Series)',
              'Impresora 3D + Lavado',
              'Kit Materiales Completo',
            ],
            note: null,
            priceLabel: 'PRECIO ESPECIAL EXPO',
            finalPrice: '29.900 €',
            discount: '-21%',
            priceNote: '+ IVA (Incluye instalación)',
            ctaText: 'SOLICITAR AHORA →',
            onCta: () => _openWhatsApp(
                'Hola, me interesa el Pack Laboratorio Digital (29.900€ + IVA). ¿Podéis darme más información?'),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SLIDE 10 — MATERIALES & ACABADO
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideMateriales() {
    return _slideWrapper(
      sectionLabel: 'ECOSISTEMA DE PRODUCCIÓN',
      title: 'Materiales & Acabado',
      subtitle: 'Calidad premium desde el fresado hasta el glaseado final.',
      child: Column(
        children: [
          _materialCard(
            image: 'assets/products/mazic_duro_cad.png',
            badgeType: 'NANO-HYBRID CERAMIC',
            trailingIcon: Icons.shield_outlined,
            title: 'MAZIC Duro',
            desc: 'La resistencia de la cerámica con la flexibilidad del composite. Ideal para casos unitarios que requieren absorción de fuerzas.',
            checks: ['Alta absorción de choque (masticación)', 'Ideal para inlays, onlays y coronas'],
          ),
          const SizedBox(height: 12),
          _materialCard(
            image: 'assets/products/mazic_claro_cad.png',
            badgeType: 'GLASS CERAMIC',
            trailingIcon: Icons.edit_outlined,
            title: 'MAZIC Claro',
            desc: 'Disilicato de litio de alta estética. Requiere proceso de CRISTALIZACIÓN en horno Duotron (NO sinterizado).',
            checks: ['Estética superior y naturalidad', 'Requiere cristalización a 850-920°C'],
            highlight: 'CRISTALIZACIÓN',
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CTA FINAL
  // ══════════════════════════════════════════════════════════════════════════
  Widget _slideCTAFinal() {
    return Container(
      color: _bg,
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
      child: Column(
        children: [
          const Text('¿Listo para transformar\ntu clínica?',
              textAlign: TextAlign.center,
              style: TextStyle(color: _white, fontSize: 26, fontWeight: FontWeight.w900, height: 1.2)),
          const SizedBox(height: 10),
          const Text(
            'Solicita una demo personalizada sin compromiso. Te mostramos el flujo completo en tu clínica.',
            textAlign: TextAlign.center,
            style: TextStyle(color: _gray, fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _openWhatsApp(
                  'Hola, quiero agendar una demo del Pack AldraScan Pro. ¿Cuándo podéis?'),
              icon: const Icon(Icons.chat_bubble, color: _white, size: 18),
              label: const Text('Solicitar Demo Gratuita',
                  style: TextStyle(color: _white, fontSize: 16, fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => openUrl('tel:+34662078540'),
              icon: const Icon(Icons.phone, color: _blue, size: 18),
              label: const Text('Llamar · 662 07 85 40',
                  style: TextStyle(color: _blue, fontSize: 15, fontWeight: FontWeight.w600)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: _blue),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Designed for Excellence · ', style: TextStyle(color: _grayDark, fontSize: 10)),
              Text('Precisión • Velocidad • Rentabilidad', style: TextStyle(color: _grayDark, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // FAB WhatsApp
  // ══════════════════════════════════════════════════════════════════════════
  Widget _fab() {
    return FloatingActionButton.extended(
      onPressed: () => _openWhatsApp('Hola, me interesa el Pack AldraScan Pro. ¿Podéis darme información?'),
      backgroundColor: const Color(0xFF25D366),
      icon: const Icon(Icons.chat_bubble, color: _white),
      label: const Text('WhatsApp', style: TextStyle(color: _white, fontWeight: FontWeight.w700)),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  /// Contenedor de slide con sección label + título + subtítulo
  Widget _slideWrapper({
    String? sectionLabel,
    String? title,
    String? subtitle,
    Widget? trailing,
    bool noLabel = false,
    required Widget child,
  }) {
    return Container(
      color: _bg,
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!noLabel) ...[
            if (sectionLabel != null) _sectionBadge(sectionLabel),
            if (title != null) ...[
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(title,
                        style: const TextStyle(
                            color: _white, fontSize: 26, fontWeight: FontWeight.w900,
                            height: 1.1, letterSpacing: -0.5)),
                  ),
                  if (trailing != null) ...[const SizedBox(width: 10), trailing],
                ],
              ),
            ],
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: _gray, fontSize: 12, height: 1.4)),
            ],
            const SizedBox(height: 20),
          ],
          child,
        ],
      ),
    );
  }

  /// Badge de sección con línea — LABEL
  Widget _sectionBadge(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 20, height: 2, color: _blue),
        const SizedBox(width: 8),
        Text(label,
            style: const TextStyle(
                color: _blue, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
      ],
    );
  }

  /// Badge pill
  Widget _badgePill(String text, Color color, {bool dotted = false, bool small = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: small ? 10 : 12, vertical: small ? 4 : 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(text,
          style: TextStyle(
              color: color,
              fontSize: small ? 10 : 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5)),
    );
  }

  /// Badge de tiempo
  Widget _timeBadge(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.schedule, color: _gray, size: 12),
          const SizedBox(width: 4),
          Text(time, style: const TextStyle(color: _grayLight, fontSize: 11)),
        ],
      ),
    );
  }

  /// Grid 2x2 de features
  Widget _feature2x2(List<_FeatureItem> items) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.4,
      crossAxisSpacing: 8,
      mainAxisSpacing: 10,
      children: items.map((f) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(f.icon, color: _blue, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(f.title, style: const TextStyle(color: _white, fontSize: 12, fontWeight: FontWeight.w700)),
                Text(f.desc, style: const TextStyle(color: _gray, fontSize: 10, height: 1.3), maxLines: 2),
              ],
            ),
          ),
        ],
      )).toList(),
    );
  }

  /// Feature inline horizontal
  Widget _featureInline(IconData icon, String title, String sub) {
    return Column(
      children: [
        Icon(icon, color: _blue, size: 20),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: _white, fontSize: 12, fontWeight: FontWeight.w600)),
        Text(sub, style: const TextStyle(color: _gray, fontSize: 10)),
      ],
    );
  }

  /// App card (ClinicCAD ecosistema)
  Widget _appCard(String image, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _cardBg, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 40, height: 40, fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.image, color: _gray, size: 24)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: _white, fontSize: 12, fontWeight: FontWeight.w700)),
                Text(desc, style: const TextStyle(color: _gray, fontSize: 10), maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tarjeta lab (Fresado / Cocción)
  Widget _labCard({
    required String image,
    required String badgeText,
    required Color badgeColor,
    required String title,
    required String desc,
    required List<String> checks,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _cardBg, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 90, height: 90, fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.precision_manufacturing, color: _gray, size: 48)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: badgeColor.withValues(alpha: 0.3)),
                  ),
                  child: Text(badgeText,
                      style: TextStyle(color: badgeColor, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                ),
                const SizedBox(height: 6),
                Text(title, style: const TextStyle(color: _white, fontSize: 15, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: _gray, fontSize: 11, height: 1.4), maxLines: 3),
                const SizedBox(height: 8),
                ...checks.expand((c) => [
                  Row(
                    children: [
                      Container(
                        width: 16, height: 16,
                        decoration: const BoxDecoration(color: _blue, shape: BoxShape.circle),
                        child: const Icon(Icons.check, color: _white, size: 10),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(c, style: const TextStyle(color: _white, fontSize: 11))),
                    ],
                  ),
                  const SizedBox(height: 4),
                ]).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tarjeta métrica ROI
  Widget _metricCard(String emoji, String badge, Color badgeColor, String label, String value, List<String> details) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _cardBg, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(badge, style: TextStyle(color: badgeColor, fontSize: 7, fontWeight: FontWeight.w800, letterSpacing: 0.3), maxLines: 1),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: _gray, fontSize: 9), maxLines: 2),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(color: _white, fontSize: 22, fontWeight: FontWeight.w900, height: 1.1)),
          const SizedBox(height: 8),
          ...details.map((d) => Text(d, style: const TextStyle(color: _gray, fontSize: 8, height: 1.4))),
        ],
      ),
    );
  }

  /// Tarjeta aplicación 3D
  Widget _app3DCard(
    String image, String badge1, Color badge1Color,
    String title, String badge2, Color badge2Color, String desc,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _cardBg, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 56, height: 56, fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.medical_services, color: _gray, size: 32)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: badge1Color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: badge1Color.withValues(alpha: 0.3)),
                      ),
                      child: Text(badge1, style: TextStyle(color: badge1Color, fontSize: 8, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(title, style: const TextStyle(color: _white, fontSize: 13, fontWeight: FontWeight.w700)),
                Text(badge2, style: TextStyle(color: badge2Color, fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: _gray, fontSize: 10, height: 1.4), maxLines: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Spec badge (35μm / 1.5s)
  Widget _specBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _blue.withValues(alpha: 0.3)),
      ),
      child: Text(text, style: const TextStyle(color: _blue, fontSize: 13, fontWeight: FontWeight.w700)),
    );
  }

  /// Tarjeta pricing Oferta Limitada
  Widget _pricingCard({
    required String badgeCard,
    required Color badgeCardColor,
    String? stockBadge,
    required String title,
    required String subtitle,
    required String originalPrice,
    required String savings,
    required List<String> items,
    String? note,
    required String priceLabel,
    required String finalPrice,
    required String discount,
    required String priceNote,
    required String ctaText,
    required VoidCallback onCta,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardBg, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header card
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeCardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(badgeCard,
                    style: const TextStyle(color: _grayLight, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
              ),
              const Spacer(),
              if (stockBadge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _amber.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _amber.withValues(alpha: 0.3)),
                  ),
                  child: Text(stockBadge, style: const TextStyle(color: _amber, fontSize: 10, fontWeight: FontWeight.w700)),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: _white, fontSize: 18, fontWeight: FontWeight.w800)),
          Text(subtitle, style: const TextStyle(color: _gray, fontSize: 12)),
          const SizedBox(height: 10),
          // Precio original + descuento
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PRECIO ORIGINAL', style: TextStyle(color: _gray, fontSize: 9, letterSpacing: 0.8)),
                  Text(originalPrice,
                      style: const TextStyle(
                          color: _gray, fontSize: 15,
                          decoration: TextDecoration.lineThrough, decorationColor: _gray)),
                ],
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: _blue.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _blue.withValues(alpha: 0.3)),
                ),
                child: Column(
                  children: [
                    const Text('💰 DESCUENTO EXPO',
                        style: TextStyle(color: _grayLight, fontSize: 8, fontWeight: FontWeight.w700)),
                    Text('🏷 $savings',
                        style: const TextStyle(color: _blue, fontSize: 10, fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Items incluidos
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Container(
                  width: 16, height: 16,
                  decoration: const BoxDecoration(color: _blue, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: _white, size: 10),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(item, style: const TextStyle(color: _white, fontSize: 12))),
              ],
            ),
          )),
          if (note != null) ...[
            const SizedBox(height: 6),
            Text(note, style: const TextStyle(color: _amber, fontSize: 11)),
          ],
          const SizedBox(height: 14),
          const Divider(color: _cardBorder),
          const SizedBox(height: 10),
          // Precio final
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(priceLabel,
                        style: const TextStyle(color: _gray, fontSize: 9, letterSpacing: 0.8)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(finalPrice,
                            style: const TextStyle(
                                color: _white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                        const SizedBox(width: 6),
                        Text(discount,
                            style: const TextStyle(
                                color: _blue, fontSize: 16, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Text(priceNote, style: const TextStyle(color: _gray, fontSize: 10)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: onCta,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                ),
                child: Text(ctaText,
                    style: const TextStyle(color: _white, fontSize: 13, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Tarjeta material (Mazic)
  Widget _materialCard({
    required String image,
    required String badgeType,
    required IconData trailingIcon,
    required String title,
    required String desc,
    required List<String> checks,
    String? highlight,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _cardBg, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen packaging
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 90, height: 100, fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.category, color: _gray, size: 48)),
          ),
          const SizedBox(width: 14),
          // Texto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _cardBorder,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(badgeType,
                          style: const TextStyle(color: _grayLight, fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                    ),
                    const Spacer(),
                    Icon(trailingIcon, color: _gray, size: 18),
                  ],
                ),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(color: _white, fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                _buildDescWithHighlight(desc, highlight),
                const SizedBox(height: 10),
                ...checks.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 16, height: 16,
                        decoration: const BoxDecoration(color: _blue, shape: BoxShape.circle),
                        child: const Icon(Icons.check, color: _white, size: 10),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(c, style: const TextStyle(color: _white, fontSize: 11))),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescWithHighlight(String text, String? highlight) {
    if (highlight == null) {
      return Text(text, style: const TextStyle(color: _gray, fontSize: 11, height: 1.4));
    }
    final parts = text.split(highlight);
    return Text.rich(
      TextSpan(
        style: const TextStyle(color: _gray, fontSize: 11, height: 1.4),
        children: [
          for (int i = 0; i < parts.length; i++) ...[
            TextSpan(text: parts[i]),
            if (i < parts.length - 1)
              TextSpan(
                text: highlight,
                style: const TextStyle(color: _white, fontWeight: FontWeight.w700),
              ),
          ],
        ],
      ),
    );
  }
}

// ── Modelos internos ──────────────────────────────────────────────────────────
class _WFCard {
  final String badge, num, product, time, image;
  final List<String> bullets;
  final Color color;
  const _WFCard({
    required this.badge, required this.num, required this.product,
    required this.time, required this.bullets, required this.image, required this.color,
  });
}

class _FeatureItem {
  final IconData icon;
  final String title, desc;
  const _FeatureItem(this.icon, this.title, this.desc);
}
