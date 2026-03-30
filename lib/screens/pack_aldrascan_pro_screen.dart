import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Pack AldraScan Pro Screen — Renovado con imágenes reales de productos
// ─────────────────────────────────────────────────────────────────────────────

class PackAldrascanProScreen extends StatefulWidget {
  const PackAldrascanProScreen({super.key});

  @override
  State<PackAldrascanProScreen> createState() => _PackAldrascanProScreenState();
}

class _PackAldrascanProScreenState extends State<PackAldrascanProScreen>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _statsController;
  late Animation<double> _heroFade;
  late Animation<Offset> _heroSlide;
  bool _showInHouse = false;
  int _activeWorkflowStep = 0;

  // ── Colores del pack ─────────────────────────────────────────────────────
  static const Color _darkBg = Color(0xFF070C18);
  static const Color _darkCard = Color(0xFF0F1928);
  static const Color _darkCardBorder = Color(0xFF1C2E48);
  static const Color _gold = Color(0xFFFFCB47);
  static const Color _goldDark = Color(0xFFB8860B);
  static const Color _blue = Color(0xFF2563EB);
  static const Color _blueLight = Color(0xFF3B82F6);
  static const Color _green = Color(0xFF10B981);
  static const Color _orange = Color(0xFFFF6B35);
  static const Color _purple = Color(0xFF8B5CF6);
  static const Color _textWhite = Color(0xFFF8FAFC);
  static const Color _textGray = Color(0xFF94A3B8);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _statsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _heroFade = CurvedAnimation(parent: _heroController, curve: Curves.easeOut);
    _heroSlide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOutCubic));
    _heroController.forward().then((_) => _statsController.forward());
  }

  @override
  void dispose() {
    _heroController.dispose();
    _statsController.dispose();
    super.dispose();
  }

  void _openWhatsApp(String msg) {
    final encoded = Uri.encodeComponent(msg);
    openUrl('https://wa.me/34662078540?text=$encoded');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkBg,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _heroFade,
              child: SlideTransition(
                position: _heroSlide,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroPriceCard(),
                    const SizedBox(height: 20),
                    _buildStatsRow(),
                    const SizedBox(height: 28),
                    _buildComponentsGallery(),
                    const SizedBox(height: 28),
                    _buildWorkflowSection(),
                    const SizedBox(height: 28),
                    _buildApplicationsGallery(),
                    const SizedBox(height: 28),
                    _buildMaterialsSection(),
                    const SizedBox(height: 28),
                    _buildRoiSection(),
                    const SizedBox(height: 28),
                    _buildInHouseModule(),
                    const SizedBox(height: 28),
                    _buildFinancingSection(),
                    const SizedBox(height: 28),
                    _buildFinalCta(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  // ─── APP BAR ─────────────────────────────────────────────────────────────
  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      backgroundColor: _darkBg,
      iconTheme: const IconThemeData(color: _textWhite),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0D3B73),
                    Color(0xFF070C18),
                    Color(0xFF12172E),
                  ],
                  stops: [0.0, 0.55, 1.0],
                ),
              ),
            ),
            // Glow dorado
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      _gold.withValues(alpha: 0.14),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Imagen decorativa fresadora top-right
            Positioned(
              right: -10,
              bottom: 0,
              child: Opacity(
                opacity: 0.18,
                child: Image.asset(
                  'assets/products/lilivis_mill_top.png',
                  height: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 20,
              right: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [_gold, Color(0xFFFFAB00)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '🏆 PACK CLÍNICA PREMIUM',
                      style: TextStyle(
                        color: Color(0xFF1A1200),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'AldraScan Pro',
                    style: TextStyle(
                      color: _textWhite,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Text(
                    'Todo en el mismo día',
                    style: TextStyle(
                      color: _gold,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Escaneo · Diseño IA · Fresado · Sinterizado',
                    style: TextStyle(
                      color: _textGray,
                      fontSize: 11,
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

  // ─── HERO PRECIO ─────────────────────────────────────────────────────────
  Widget _buildHeroPriceCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1352A0), Color(0xFF0D3B73), Color(0xFF061A35)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold.withValues(alpha: 0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: _blue.withValues(alpha: 0.45),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PRECIO EXPODENTAL 2026',
                        style: TextStyle(
                          color: _textGray,
                          fontSize: 10,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '39.900 €',
                            style: TextStyle(
                              color: _textWhite,
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1.5,
                              height: 1,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: _green.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: _green.withValues(alpha: 0.4)),
                            ),
                            child: const Text(
                              '+IVA',
                              style: TextStyle(
                                color: _green,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            'PVP: 48.500 €  ',
                            style: TextStyle(
                              color: _textMuted,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: _textMuted,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF6B35), Color(0xFFFF4500)],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'AHORRAS 8.600 €',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Imagen escáner
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/products/medit_i900_mobility_real.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: _darkCard,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.scanner, color: _textGray, size: 36),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: _darkCardBorder),
            const SizedBox(height: 12),
            // Financiación destacada
            Row(
              children: [
                const Icon(Icons.credit_card, color: _gold, size: 18),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Desde ',
                          style: TextStyle(color: _textGray, fontSize: 13),
                        ),
                        TextSpan(
                          text: '665 €/mes',
                          style: TextStyle(
                            color: _gold,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: ' · 60 meses · sin intereses',
                          style: TextStyle(color: _textGray, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Ventajas clave en pills
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _pill('✅ Instalación VIP', _green),
                _pill('🎓 Formación incluida', _blue),
                _pill('🔧 Soporte 24h', _orange),
                _pill('📦 Entrega express', _purple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pill(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }

  // ─── STATS ROW ────────────────────────────────────────────────────────────
  Widget _buildStatsRow() {
    final stats = [
      ('40–60', 'coronas/mes', _gold),
      ('+265%', 'ROI a 3 años', _green),
      ('Mes 7-8', 'break-even', _blue),
      ('80 €', 'ahorro/corona', _orange),
    ];
    return SizedBox(
      height: 88,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final s = stats[i];
          return Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              color: _darkCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: (s.$3).withValues(alpha: 0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  s.$1,
                  style: TextStyle(
                    color: s.$3,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  s.$2,
                  style: const TextStyle(
                    color: _textGray,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ─── GALERÍA DE COMPONENTES CON IMÁGENES REALES ──────────────────────────
  Widget _buildComponentsGallery() {
    final components = [
      _ComponentItem(
        image: 'assets/products/medit_i900_mobility_real.png',
        title: 'Medit i900 Mobility',
        subtitle: 'Escáner inalámbrico',
        badge: 'TOP GAMA',
        badgeColor: _gold,
        value: '13.900 €',
        icon: Icons.wifi,
        iconColor: _blue,
        highlight: '100 FPS · 4.9 µm',
      ),
      _ComponentItem(
        image: 'assets/products/cliniccad_logo.png',
        title: 'ClinicCAD',
        subtitle: 'Software CAD/CAM con IA',
        badge: 'LICENCIA PERPETUA',
        badgeColor: _purple,
        value: '4.200 €',
        icon: Icons.auto_awesome,
        iconColor: _purple,
        highlight: 'Diseño automático IA',
      ),
      _ComponentItem(
        image: 'assets/products/lilivis_mill_top.png',
        title: 'Lilivis Mill LM-100',
        subtitle: 'Fresadora dual doble husillo',
        badge: 'SECO + HÚMEDO',
        badgeColor: _blueLight,
        value: '18.500 €',
        icon: Icons.settings,
        iconColor: _blueLight,
        highlight: '±25 µm · 50.000 rpm',
      ),
      _ComponentItem(
        image: 'assets/products/duotron_t5200.png',
        title: 'Duotron T-5200',
        subtitle: 'Horno de sinterizado',
        badge: 'RÁPIDO 2H',
        badgeColor: _orange,
        value: '5.800 €',
        icon: Icons.local_fire_department,
        iconColor: _orange,
        highlight: '1.100 °C · bomba vacío',
      ),
      _ComponentItem(
        image: 'assets/products/panda_smart_ipad.png',
        title: 'iPad Pro + Soporte',
        subtitle: 'Integrado con escáner',
        badge: 'REGALO',
        badgeColor: _green,
        value: '1.899 €',
        icon: Icons.tablet_mac,
        iconColor: _green,
        highlight: 'Chip M5 · incluido',
      ),
      _ComponentItem(
        image: 'assets/products/elegoo_mars5.png',
        title: 'Elegoo Mars 5',
        subtitle: 'Impresora 3D MSLA dental',
        badge: 'INCLUIDA',
        badgeColor: _green,
        value: '890 €',
        icon: Icons.print,
        iconColor: _textGray,
        highlight: '50 µm · resinas dentales',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('📦 Componentes del Pack', subtitle: '6 equipos premium · valor total 45.189 €'),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: components.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) => _buildComponentCard(components[i]),
          ),
        ),
      ],
    );
  }

  Widget _buildComponentCard(_ComponentItem item) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: _darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _darkCardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen producto
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 110,
              width: double.infinity,
              color: const Color(0xFF141E30),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      item.image,
                      height: 90,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        item.icon,
                        color: item.iconColor,
                        size: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: item.badgeColor.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.badge,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 7,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: _textWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: const TextStyle(color: _textGray, fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  item.highlight,
                  style: const TextStyle(
                    color: _gold,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.value,
                  style: const TextStyle(
                    color: _textMuted,
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: _textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── WORKFLOW CON IMÁGENES ────────────────────────────────────────────────
  Widget _buildWorkflowSection() {
    final steps = [
      _WorkflowStep(
        step: 1,
        icon: Icons.sensors,
        title: 'Escanear',
        time: '3–5 min',
        description: 'Medit i900 captura el arco dental completo con 100 FPS de precisión 4.9 µm.',
        image: 'assets/products/medit_i900_mobility_real.png',
        color: _blue,
      ),
      _WorkflowStep(
        step: 2,
        icon: Icons.auto_awesome,
        title: 'Diseñar con IA',
        time: '5–8 min',
        description: 'ClinicCAD genera el diseño automáticamente usando inteligencia artificial.',
        image: 'assets/products/cliniccad_logo.png',
        color: _purple,
      ),
      _WorkflowStep(
        step: 3,
        icon: Icons.precision_manufacturing,
        title: 'Fresar',
        time: '8–15 min',
        description: 'Lilivis Mill mecaniza bloques de zirconia, cerámica o PMMA con precisión ±25 µm.',
        image: 'assets/products/lilivis_mill_top.png',
        color: _blueLight,
      ),
      _WorkflowStep(
        step: 4,
        icon: Icons.local_fire_department,
        title: 'Sinterizar',
        time: '2–4 h',
        description: 'Duotron T-5200 sinteriza la corona a 1.100 °C con ciclo rápido.',
        image: 'assets/products/duotron_t5200.png',
        color: _orange,
      ),
      _WorkflowStep(
        step: 5,
        icon: Icons.check_circle,
        title: 'Entregar',
        time: 'Mismo día',
        description: 'Corona o prótesis lista para cementar. Sin segundas citas. Sin laboratorio externo.',
        image: 'assets/products/protesis_completa.png',
        color: _green,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('⚡ Flujo de Trabajo', subtitle: 'De la boca al diente · Todo en una sesión'),
        const SizedBox(height: 16),
        // Selector de pasos
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: steps.length,
            separatorBuilder: (_, __) => const SizedBox(width: 4),
            itemBuilder: (context, i) {
              final isActive = _activeWorkflowStep == i;
              return GestureDetector(
                onTap: () => setState(() => _activeWorkflowStep = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: isActive
                        ? LinearGradient(
                            colors: [
                              steps[i].color,
                              steps[i].color.withValues(alpha: 0.7),
                            ],
                          )
                        : null,
                    color: isActive ? null : _darkCard,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isActive ? steps[i].color : _darkCardBorder,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        steps[i].icon,
                        color: isActive ? Colors.white : steps[i].color,
                        size: 18,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        steps[i].title,
                        style: TextStyle(
                          color: isActive ? Colors.white : _textGray,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Detalle paso activo
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: _buildWorkflowDetail(steps[_activeWorkflowStep]),
        ),
        // Línea de tiempo global
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _darkCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _gold.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              const Icon(Icons.timer, color: _gold, size: 20),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiempo total del proceso',
                      style: TextStyle(color: _textGray, fontSize: 11),
                    ),
                    Text(
                      '2–4 horas · Una sola cita',
                      style: TextStyle(
                        color: _textWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [_gold, Color(0xFFFFAB00)]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'MISMO DÍA',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkflowDetail(_WorkflowStep step) {
    return Container(
      key: ValueKey(step.step),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            step.color.withValues(alpha: 0.12),
            _darkCard,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: step.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          // Imagen del equipo
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.black.withValues(alpha: 0.3),
              child: Image.asset(
                step.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  step.icon,
                  color: step.color,
                  size: 40,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [step.color, step.color.withValues(alpha: 0.7)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${step.step}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      step.title,
                      style: TextStyle(
                        color: step.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: step.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        step.time,
                        style: TextStyle(
                          color: step.color,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  step.description,
                  style: const TextStyle(
                    color: _textGray,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── GALERÍA DE APLICACIONES CLÍNICAS ────────────────────────────────────
  Widget _buildApplicationsGallery() {
    final apps = [
      ('assets/products/protesis_completa.png', 'Prótesis Completa', 'Arcada completa mismo día'),
      ('assets/products/modelo_3d_dental.png', 'Modelos Digitales', 'Impresión 3D desde escaneo'),
      ('assets/products/denticion_modelo.png', 'Estudio Diagnóstico', 'Modelos de estudio digital'),
      ('assets/products/férula_dental.png', 'Férulas y Guías', 'Férulas oclusales precisas'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('🦷 Aplicaciones Clínicas', subtitle: 'Todo lo que puedes fabricar en clínica'),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: apps.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final app = apps[i];
              return Container(
                width: 155,
                decoration: BoxDecoration(
                  color: _darkCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: _darkCardBorder),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Container(
                          color: const Color(0xFF141E30),
                          child: Center(
                            child: Image.asset(
                              app.$1,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.medical_services,
                                color: _textGray,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            app.$2,
                            style: const TextStyle(
                              color: _textWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            app.$3,
                            style: const TextStyle(
                              color: _textGray,
                              fontSize: 10,
                            ),
                            maxLines: 2,
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
      ],
    );
  }

  // ─── MATERIALES INCLUIDOS ─────────────────────────────────────────────────
  Widget _buildMaterialsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('🧱 Materiales Incluidos', subtitle: 'Kit de arranque valorado en 3.200 €'),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: _buildMaterialCard(
                image: 'assets/products/mazic_claro_cad.png',
                name: 'Mazic Claro CAD',
                desc: 'Zirconia traslúcida de alta estética. Óptima para frente anterior.',
                highlight: '98 mm Ø · 14 bloques',
                color: _blue,
              )),
              const SizedBox(width: 12),
              Expanded(child: _buildMaterialCard(
                image: 'assets/products/mazic_duro_cad.png',
                name: 'Mazic Duro CAD',
                desc: 'Zirconia de alta resistencia. Ideal para posteriores y puentes.',
                highlight: 'Alta resistencia · 14 bloques',
                color: _purple,
              )),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _darkCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _green.withValues(alpha: 0.2)),
          ),
          child: const Row(
            children: [
              Icon(Icons.inventory_2, color: _green, size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kit Completo de Materiales',
                      style: TextStyle(
                        color: _textWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '14 bloques Mazic Claro · 14 bloques Mazic Duro · Resina PMMA · Discos de PMMA · Resinas de impresión dental · Material de empaque',
                      style: TextStyle(color: _textGray, fontSize: 11, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialCard({
    required String image,
    required String name,
    required String desc,
    required String highlight,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            color: const Color(0xFF141E30),
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(Icons.square, color: color, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(color: _textGray, fontSize: 10, height: 1.4),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              highlight,
              style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // ─── ROI & RENTABILIDAD ───────────────────────────────────────────────────
  Widget _buildRoiSection() {
    final roiItems = [
      ('💰', 'Ahorro por corona', '80 €', 'vs laboratorio externo'),
      ('📈', 'ROI a 3 años', '+265%', 'retorno sobre inversión'),
      ('⚡', 'Break-even', 'Mes 7-8', 'recuperas la inversión'),
      ('🦷', 'Producción mensual', '40-60', 'coronas fabricadas'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('📊 ROI y Rentabilidad', subtitle: 'Números reales · Retorno verificado'),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.7,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: roiItems.map((item) => Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _darkCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _darkCardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(item.$1, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item.$2,
                        style: const TextStyle(
                          color: _textGray,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.$3,
                  style: const TextStyle(
                    color: _gold,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  item.$4,
                  style: const TextStyle(color: _textMuted, fontSize: 9),
                ),
              ],
            ),
          )).toList(),
        ),
      ],
    );
  }

  // ─── MÓDULO IN-HOUSE ──────────────────────────────────────────────────────
  Widget _buildInHouseModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('🏭 Módulo In-House Avanzado', subtitle: 'Amplía tu clínica · Opcional'),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => setState(() => _showInHouse = !_showInHouse),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _purple.withValues(alpha: 0.12),
                  _darkCard,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _purple.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upgrade In-House Completo',
                        style: TextStyle(
                          color: _textWhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Lilivis Mill + Duotron T-5200 + Elegoo Mars 5',
                        style: TextStyle(color: _textGray, fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '+ 29.900 €',
                        style: TextStyle(
                          color: _purple,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _showInHouse ? Icons.expand_less : Icons.expand_more,
                  color: _purple,
                ),
              ],
            ),
          ),
        ),
        if (_showInHouse) ...[
          const SizedBox(height: 12),
          _buildInHouseDetail(),
        ],
      ],
    );
  }

  Widget _buildInHouseDetail() {
    final items = [
      (
        'assets/products/lilivis_mill_top.png',
        'Lilivis Mill LM-100',
        'Fresadora dual doble husillo 3 ejes',
        'Seco + Húmedo · ±25 µm',
        _blueLight,
      ),
      (
        'assets/products/duotron_t5200.png',
        'Duotron T-5200',
        'Horno de sinterizado con bomba vacío',
        '1.100 °C · ciclo 2h rápido',
        _orange,
      ),
      (
        'assets/products/elegoo_mars5.png',
        'Elegoo Mars 5',
        'Impresora 3D MSLA de alta precisión',
        '50 µm · resinas dentales',
        _purple,
      ),
    ];

    return Column(
      children: items.map((item) => Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _darkCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: item.$5.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                item.$1,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.precision_manufacturing,
                  color: item.$5,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.$2,
                    style: const TextStyle(
                      color: _textWhite,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item.$3,
                    style: const TextStyle(color: _textGray, fontSize: 11),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: item.$5.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      item.$4,
                      style: TextStyle(
                        color: item.$5,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  // ─── FINANCIACIÓN ─────────────────────────────────────────────────────────
  Widget _buildFinancingSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _green.withValues(alpha: 0.1),
            _darkCard,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _green.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance, color: _green, size: 22),
              const SizedBox(width: 10),
              const Text(
                'Opciones de Financiación',
                style: TextStyle(
                  color: _textWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _finRow('60 meses', '665 €/mes', 'Cuota más cómoda', _gold),
          const SizedBox(height: 10),
          _finRow('48 meses', '832 €/mes', 'Equilibrio ideal', _blueLight),
          const SizedBox(height: 10),
          _finRow('36 meses', '1.109 €/mes', 'Menor coste total', _green),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _gold.withValues(alpha: 0.2)),
            ),
            child: const Row(
              children: [
                Icon(Icons.star, color: _gold, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Miembros COEC/RCOE · Condiciones especiales adicionales disponibles',
                    style: TextStyle(color: _gold, fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _finRow(String plazo, String cuota, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 72,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            plazo,
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          cuota,
          style: const TextStyle(
            color: _textWhite,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: _textGray, fontSize: 11),
        ),
      ],
    );
  }

  // ─── CTA FINAL ────────────────────────────────────────────────────────────
  Widget _buildFinalCta() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1352A0),
            Color(0xFF0A0E1A),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _gold.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _blue.withValues(alpha: 0.35),
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          // Panda Elf escáner de entrada
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/products/panda_elf_scanner.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.sensors,
                    color: _textGray,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¿Quieres empezar con menos presupuesto?',
                      style: TextStyle(
                        color: _textGray,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Pack Iniciación con Panda Elf',
                      style: TextStyle(
                        color: _textWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Escáner de entrada · 6.900 € todo incluido',
                      style: TextStyle(color: _gold, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: _darkCardBorder),
          const SizedBox(height: 20),
          const Text(
            '¿Listo para transformar tu clínica?',
            style: TextStyle(
              color: _textWhite,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Solicita una demostración personalizada sin compromiso. Te mostramos el flujo completo en tu clínica.',
            style: TextStyle(
              color: _textGray,
              fontSize: 13,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // Botón WhatsApp principal
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _openWhatsApp(
                'Hola, me interesa el Pack AldraScan Pro (39.900€ + IVA). '
                'Me gustaría recibir una demostración personalizada. ¿Podéis contactarme?',
              ),
              icon: const Icon(Icons.chat, color: Colors.white),
              label: const Text(
                'Solicitar Demostración Gratis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 8,
                shadowColor: const Color(0xFF25D366).withValues(alpha: 0.4),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Botón teléfono
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => openUrl('tel:+34662078540'),
              icon: const Icon(Icons.phone, color: _gold, size: 18),
              label: const Text(
                'Llamar ahora · 662 07 85 40',
                style: TextStyle(
                  color: _gold,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: _gold, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── FAB WhatsApp ─────────────────────────────────────────────────────────
  Widget _buildFab() {
    return FloatingActionButton.extended(
      onPressed: () => _openWhatsApp(
        'Hola, me interesa el Pack AldraScan Pro. ¿Podéis darme más información?',
      ),
      backgroundColor: const Color(0xFF25D366),
      icon: const Icon(Icons.chat_bubble, color: Colors.white),
      label: const Text(
        'WhatsApp',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }

  // ─── HELPER: Título de sección ────────────────────────────────────────────
  Widget _sectionTitle(String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _textWhite,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                color: _textGray,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── MODELOS DE DATOS INTERNOS ────────────────────────────────────────────────

class _ComponentItem {
  final String image;
  final String title;
  final String subtitle;
  final String badge;
  final Color badgeColor;
  final String value;
  final IconData icon;
  final Color iconColor;
  final String highlight;

  const _ComponentItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.badgeColor,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.highlight,
  });
}

class _WorkflowStep {
  final int step;
  final IconData icon;
  final String title;
  final String time;
  final String description;
  final String image;
  final Color color;

  const _WorkflowStep({
    required this.step,
    required this.icon,
    required this.title,
    required this.time,
    required this.description,
    required this.image,
    required this.color,
  });
}
