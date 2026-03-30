import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Pack AldraScan Pro Screen — Estilo premium oscuro, basado en el PDF
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

  // ── Colores del pack ─────────────────────────────────────────────────────
  static const Color _darkBg = Color(0xFF0A0E1A);
  static const Color _darkCard = Color(0xFF111827);
  static const Color _darkCardBorder = Color(0xFF1E2D45);
  static const Color _gold = Color(0xFFFFCB47);
  static const Color _blue = Color(0xFF2563EB);
  static const Color _green = Color(0xFF10B981);
  static const Color _orange = Color(0xFFFF6B35);
  static const Color _textWhite = Color(0xFFF8FAFC);
  static const Color _textGray = Color(0xFF94A3B8);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
          // ── App Bar ────────────────────────────────────────────────────────
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _heroFade,
              child: SlideTransition(
                position: _heroSlide,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── Hero precio ──────────────────────────────────────────
                    _buildHeroPriceCard(),
                    const SizedBox(height: 24),
                    // ── Qué incluye ──────────────────────────────────────────
                    _buildWhatIsIncluded(),
                    const SizedBox(height: 24),
                    // ── Workflow pasos ──────────────────────────────────────
                    _buildWorkflow(),
                    const SizedBox(height: 24),
                    // ── ROI & Rentabilidad ───────────────────────────────────
                    _buildRoiSection(),
                    const SizedBox(height: 24),
                    // ── Módulo in-house opcional ─────────────────────────────
                    _buildInHouseModule(),
                    const SizedBox(height: 24),
                    // ── Financiación ─────────────────────────────────────────
                    _buildFinancingSection(),
                    const SizedBox(height: 24),
                    // ── CTA final ────────────────────────────────────────────
                    _buildFinalCta(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // ── Botón flotante WhatsApp ─────────────────────────────────────────────
      floatingActionButton: _buildFab(),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // APP BAR
  // ─────────────────────────────────────────────────────────────────────────
  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: _darkBg,
      iconTheme: const IconThemeData(color: _textWhite),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Gradiente fondo
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0D3B73),
                    Color(0xFF0A0E1A),
                    Color(0xFF1B1B2E),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
            // Patrón decorativo
            Positioned(
              top: -30,
              right: -30,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      _gold.withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge superior
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
                      fontSize: 28,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // HERO PRECIO
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeroPriceCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1352A0), Color(0xFF0D3B73), Color(0xFF061A35)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold.withValues(alpha: 0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: _blue.withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Precio con tachado
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Precio Expodental 2026',
                      style: TextStyle(color: _textGray, fontSize: 11, letterSpacing: 0.5),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '39.900 €',
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
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
                            style: TextStyle(color: _green, fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          'PVP: 48.500 €',
                          style: TextStyle(
                            color: _textMuted,
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: _textMuted,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _orange.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: _orange.withValues(alpha: 0.4)),
                          ),
                          child: const Text(
                            'Ahorras 8.600 €',
                            style: TextStyle(
                              color: _orange,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFF1E3A5F), height: 1),
            const SizedBox(height: 14),
            // Mini stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _miniStat('🏆', 'Pack\nCompleto'),
                _miniStatDivider(),
                _miniStat('📅', 'Formación\nIncluida'),
                _miniStatDivider(),
                _miniStat('🛠️', 'Instalación\nIncluida'),
                _miniStatDivider(),
                _miniStat('📞', 'Soporte\n24/7'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniStat(String emoji, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: _textGray,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _miniStatDivider() {
    return Container(width: 1, height: 36, color: const Color(0xFF1E3A5F));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // QUÉ INCLUYE
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildWhatIsIncluded() {
    final components = [
      _PackComponent(
        icon: Icons.document_scanner_outlined,
        color: const Color(0xFF2563EB),
        title: 'Medit i900 Mobility',
        subtitle: 'Escáner intraoral inalámbrico',
        detail: 'Wi-Fi 6E · 10,9 µm · 70 FPS · 242 g\n3 baterías + maletín',
        valueTag: 'Incluido',
      ),
      _PackComponent(
        icon: Icons.computer_outlined,
        color: const Color(0xFF7C3AED),
        title: 'ClinicCAD & L-CAM',
        subtitle: 'Software CAD/CAM perpetuo',
        detail: 'IA Modeling · OrthoSimulator\nSmile Design · Licencia perpetua',
        valueTag: 'Licencia perpetua',
      ),
      _PackComponent(
        icon: Icons.precision_manufacturing_outlined,
        color: const Color(0xFF059669),
        title: 'Lilivis Mill LM-100',
        subtitle: 'Fresadora dual húmedo/seco',
        detail: '4 motores · 50.000 RPM · ±25 µm\nProcesado húmedo y seco',
        valueTag: 'Fresadora pro',
      ),
      _PackComponent(
        icon: Icons.tablet_mac_outlined,
        color: const Color(0xFF0891B2),
        title: 'iPad Pro 13"',
        subtitle: 'Control y presentación',
        detail: 'Gestión del flujo de trabajo\nPresentación de casos clínicos',
        valueTag: 'Regalo',
      ),
      _PackComponent(
        icon: Icons.inventory_2_outlined,
        color: const Color(0xFFD97706),
        title: 'Kit de Materiales',
        subtitle: 'Completo para empezar',
        detail: 'Discos de zirconio, PMMA\nResinas y materiales de inicio',
        valueTag: 'Kit completo',
      ),
      _PackComponent(
        icon: Icons.school_outlined,
        color: const Color(0xFFDC2626),
        title: 'Formación Clínica',
        subtitle: 'In-situ + certificación',
        detail: 'Formación presencial en clínica\nCertificación oficial incluida',
        valueTag: 'Formación oficial',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('📦 ¿Qué incluye el Pack?', '6 componentes de alto valor'),
        const SizedBox(height: 12),
        ...components.map((c) => _buildComponentCard(c)),
      ],
    );
  }

  Widget _buildComponentCard(_PackComponent c) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _darkCardBorder, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: c.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: c.color.withValues(alpha: 0.25), width: 1),
            ),
            child: Icon(c.icon, color: c.color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      c.title,
                      style: const TextStyle(
                        color: _textWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: c.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: c.color.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        c.valueTag,
                        style: TextStyle(
                          color: c.color,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  c.subtitle,
                  style: const TextStyle(color: _textGray, fontSize: 11),
                ),
                const SizedBox(height: 4),
                Text(
                  c.detail,
                  style: const TextStyle(
                    color: _textMuted,
                    fontSize: 10.5,
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

  // ─────────────────────────────────────────────────────────────────────────
  // WORKFLOW
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildWorkflow() {
    final steps = [
      _WorkflowStep('1', '📷', 'Escaneo', '3-5 min', _blue),
      _WorkflowStep('2', '🎨', 'Diseño CAD', '5-8 min', const Color(0xFF7C3AED)),
      _WorkflowStep('3', '⚙️', 'Fresado', '8-15 min', const Color(0xFF059669)),
      _WorkflowStep('4', '🔥', 'Sinterizado', '2-4 h', const Color(0xFFD97706)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('⚡ Flujo de Trabajo', 'Corona en el mismo día'),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _darkCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _darkCardBorder),
          ),
          child: Column(
            children: [
              Row(
                children: List.generate(steps.length, (i) {
                  final step = steps[i];
                  return Expanded(
                    child: Row(
                      children: [
                        Expanded(child: _buildWorkflowStep(step)),
                        if (i < steps.length - 1)
                          Icon(Icons.arrow_forward_rounded, color: _textMuted, size: 16),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_green.withValues(alpha: 0.15), _blue.withValues(alpha: 0.15)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _green.withValues(alpha: 0.3)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_rounded, color: _green, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Corona terminada — misma visita del paciente',
                      style: TextStyle(
                        color: _green,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
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

  Widget _buildWorkflowStep(_WorkflowStep step) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: step.color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(color: step.color.withValues(alpha: 0.35), width: 1.5),
          ),
          child: Center(
            child: Text(step.emoji, style: const TextStyle(fontSize: 18)),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          step.name,
          style: const TextStyle(
            color: _textWhite,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          step.time,
          style: TextStyle(
            color: step.color,
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // ROI & RENTABILIDAD
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildRoiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('📈 Rentabilidad', 'Retorno de la inversión'),
        const SizedBox(height: 12),
        // Tarjeta ROI principal
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF064E3B), Color(0xFF065F46), Color(0xFF047857)],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _green.withValues(alpha: 0.35), width: 1),
            boxShadow: [
              BoxShadow(
                color: _green.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _roiStat('+265%', 'ROI a\n3 años', _gold),
                  Container(width: 1, height: 50, color: Colors.white12),
                  _roiStat('7-8', 'Meses hasta\nbreak-even', Colors.lightGreenAccent),
                  Container(width: 1, height: 50, color: Colors.white12),
                  _roiStat('80€', 'Ahorro neto\npor corona', Colors.cyanAccent),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Ahorro por procedimiento
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _darkCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _darkCardBorder),
          ),
          child: Column(
            children: [
              _savingsRow('👑', 'Corona unitaria en clínica', '80 € ahorrado', const Color(0xFF059669)),
              _dividerLine(),
              _savingsRow('✨', 'Carilla de porcelana', '108 € ahorrado', const Color(0xFF2563EB)),
              _dividerLine(),
              _savingsRow('🦷', 'Inlay/Onlay cerámico', '65 € ahorrado', const Color(0xFF7C3AED)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roiStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 26,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10,
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _savingsRow(String emoji, String label, String saving, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: _textGray, fontSize: 12),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Text(
              saving,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // MÓDULO IN-HOUSE OPCIONAL
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildInHouseModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('🏭 Módulo In-House', 'Producción interna opcional'),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => setState(() => _showInHouse = !_showInHouse),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF4C1D95).withValues(alpha: 0.8),
                  const Color(0xFF5B21B6).withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF7C3AED).withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pack In-House',
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '+ 29.900 € adicionales',
                          style: TextStyle(
                            color: Color(0xFFA78BFA),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    AnimatedRotation(
                      turns: _showInHouse ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white70,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                if (_showInHouse) ...[
                  const SizedBox(height: 14),
                  const Divider(color: Colors.white12, height: 1),
                  const SizedBox(height: 14),
                  _inHouseItem(
                    Icons.precision_manufacturing_outlined,
                    'Fresadora Lilivis Mill',
                    'Producción in-house completa',
                  ),
                  const SizedBox(height: 8),
                  _inHouseItem(
                    Icons.local_fire_department_outlined,
                    'Horno Duotron',
                    'Hasta 1.600 °C · Ciclos 2-4 horas',
                  ),
                  const SizedBox(height: 8),
                  _inHouseItem(
                    Icons.print_outlined,
                    'Impresora 3D',
                    'Complemento opcional (+10.000 €)',
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline_rounded, color: Color(0xFFA78BFA), size: 16),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'El horno de sinterizado se vende por separado. Consulta condiciones.',
                            style: TextStyle(
                              color: Color(0xFFA78BFA),
                              fontSize: 11,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _inHouseItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white70, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: _textWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // FINANCIACIÓN
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFinancingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('💳 Financiación Exclusiva', 'Sin estrés financiero'),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _darkCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _darkCardBorder),
          ),
          child: Column(
            children: [
              // Cuota principal
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1352A0), Color(0xFF2563EB)],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.credit_card_rounded, color: Colors.white, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Desde 665 €/mes',
                            style: TextStyle(
                              color: _textWhite,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const Text(
                            '60 meses · Financiación hasta 60 meses',
                            style: TextStyle(color: _textGray, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Color(0xFF1E2D45), height: 1),
              // Ventajas colegiados
              _financingPerk(
                Icons.school_outlined,
                'Colegiados COEC / RCOE',
                '3 meses de carencia · Pagas en 90 días',
                _gold,
              ),
              _dividerLine(),
              _financingPerk(
                Icons.verified_outlined,
                'Sin entrada',
                'Empieza sin desembolso inicial',
                _green,
              ),
              _dividerLine(),
              _financingPerk(
                Icons.support_agent_outlined,
                'Asesor financiero dedicado',
                'Te acompañamos en todo el proceso',
                const Color(0xFF2563EB),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _financingPerk(IconData icon, String title, String subtitle, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: _textWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: _textGray, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // CTA FINAL
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFinalCta() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFB45309), Color(0xFFD97706), Color(0xFFFFCB47)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.4),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Listo para la nueva era\nde la odontología digital?',
              style: TextStyle(
                color: Color(0xFF1A1200),
                fontSize: 18,
                fontWeight: FontWeight.w900,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Precisión · Velocidad · Rentabilidad\nDel escaneado a la colocación — en tu clínica',
              style: TextStyle(
                color: Color(0xFF3D2800),
                fontSize: 12,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _openWhatsApp(
                      'Hola, me interesa el Pack AldraScan Pro (39.900€ + IVA). ¿Podéis darme más información sobre condiciones y disponibilidad?',
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D1B2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_rounded, color: Color(0xFF25D366), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'WhatsApp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => openUrl('tel:+34662078540'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1352A0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call_rounded, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Llamar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // FAB
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFab() {
    return FloatingActionButton.extended(
      onPressed: () => _openWhatsApp(
        'Hola, me interesa el Pack AldraScan Pro (39.900€ + IVA). ¿Podéis darme más información?',
      ),
      backgroundColor: const Color(0xFF25D366),
      foregroundColor: Colors.white,
      icon: const Icon(Icons.chat_rounded),
      label: const Text(
        'Solicitar Pack',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // HELPERS
  // ─────────────────────────────────────────────────────────────────────────
  Widget _sectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _textWhite,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              color: _textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dividerLine() {
    return const Divider(
      color: Color(0xFF1E2D45),
      height: 1,
      indent: 14,
      endIndent: 14,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Modelos de datos internos
// ─────────────────────────────────────────────────────────────────────────────
class _PackComponent {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String detail;
  final String valueTag;

  const _PackComponent({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.valueTag,
  });
}

class _WorkflowStep {
  final String number;
  final String emoji;
  final String name;
  final String time;
  final Color color;

  const _WorkflowStep(this.number, this.emoji, this.name, this.time, this.color);
}
