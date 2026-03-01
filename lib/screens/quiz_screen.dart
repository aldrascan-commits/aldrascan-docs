import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

// ─── Modelo ────────────────────────────────────────────────────────────────────

class _QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String? emoji;

  const _QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.emoji,
  });
}

// ─── Preguntas ──────────────────────────────────────────────────────────────────

const List<_QuizQuestion> _questions = [
  _QuizQuestion(
    question: '¿Qué tipo de escáner te permite digitalizar directamente en la boca del paciente?',
    options: [
      'Escáner de sobremesa (desktop)',
      'Escáner intraoral',
      'Tomógrafo CBCT',
      'Fresadora CAD/CAM',
    ],
    correctIndex: 1,
    explanation: 'El escáner intraoral captura impresiones digitales directamente en la boca, eliminando el yeso. Es el primer paso del flujo digital dental.',
    emoji: '🦷',
  ),
  _QuizQuestion(
    question: '¿Para qué sirve un CBCT en odontología?',
    options: [
      'Imprimir prótesis en 3D',
      'Escanear piezas dentales en el laboratorio',
      'Obtener imágenes 3D de hueso y estructuras craneofaciales',
      'Fresar coronas de zirconio',
    ],
    correctIndex: 2,
    explanation: 'El CBCT (Cone Beam Computed Tomography) genera imágenes tridimensionales de hueso, dientes e implantes. Esencial para planificación de implantes y ortodoncia.',
    emoji: '🔬',
  ),
  _QuizQuestion(
    question: '¿Cuál es la principal ventaja del Medit i900 frente a escáneres convencionales?',
    options: [
      'Es el escáner más barato del mercado',
      'Solo funciona con Windows XP',
      'Captura a color HD con altísima precisión y velocidad ultrarrápida',
      'Requiere polvo de escaneo en todas las piezas',
    ],
    correctIndex: 2,
    explanation: 'El Medit i900 destaca por su velocidad de escaneo ultrarrápida, captura a todo color HD y su precisión clínica de ±5 μm, sin necesidad de polvo.',
    emoji: '⚡',
  ),
  _QuizQuestion(
    question: '¿Qué produce una fresadora dental CAD/CAM?',
    options: [
      'Radiografías panorámicas',
      'Coronas, puentes, inlays y estructuras protésicas fresadas en materiales como zirconio o PMMA',
      'Modelos de escayola tradicionales',
      'Imágenes tomográficas 3D',
    ],
    correctIndex: 1,
    explanation: 'La fresadora CAD/CAM fabrica restauraciones dentales (coronas, puentes, inlays) a partir de bloques de zirconio, cerámica, PMMA o resina compuesta.',
    emoji: '⚙️',
  ),
  _QuizQuestion(
    question: '¿Qué significa "flujo de trabajo digital completo" en odontología?',
    options: [
      'Usar solo el ordenador para hacer pedidos online',
      'Digitalizar con escáner intraoral → diseñar con software CAD → fabricar con fresadora o impresora 3D',
      'Enviar radiografías por email',
      'Instalar WiFi en la clínica',
    ],
    correctIndex: 1,
    explanation: 'El flujo digital completo conecta: Escaneo intraoral → Software de diseño (CAD) → Fabricación (fresado/impresión 3D). Esto reduce tiempos, mejora precisión y elimina impresiones físicas.',
    emoji: '🔄',
  ),
  _QuizQuestion(
    question: '¿Para qué se utiliza una impresora 3D dental como la Elegoo Mars?',
    options: [
      'Tomar radiografías periapicales',
      'Producir modelos de estudio, férulas, guías quirúrgicas y prótesis provisionales en resina',
      'Escanear arcadas dentales',
      'Realizar el fresado de zirconio',
    ],
    correctIndex: 1,
    explanation: 'La impresora 3D dental imprime en resina fotopolimerizable: modelos de estudio, guías de implantes, alineadores, prótesis provisionales y férulas oclusales.',
    emoji: '🖨️',
  ),
  _QuizQuestion(
    question: '¿Cuál es la función principal del horno dental (como el Duotron)?',
    options: [
      'Imprimir en 3D capas de resina',
      'Sinterizar/cristalizar zirconio y cerámica tras el fresado para obtener la dureza y estética final',
      'Esterilizar instrumentos quirúrgicos',
      'Mezclar materiales de impresión',
    ],
    correctIndex: 1,
    explanation: 'El horno dental sinteriza el zirconio y cristaliza la cerámica después del fresado. Convierte el bloque pre-sinterizado en la restauración definitiva con color y dureza finales.',
    emoji: '🔥',
  ),
  _QuizQuestion(
    question: '¿Qué tipo de escáner necesitas para digitalizar un modelo de yeso en el laboratorio?',
    options: [
      'Escáner intraoral',
      'Tomógrafo CBCT',
      'Escáner de sobremesa (desktop scanner)',
      'Cámara fotográfica convencional',
    ],
    correctIndex: 2,
    explanation: 'El escáner de sobremesa (desktop) digitaliza modelos de yeso, prótesis removibles o impresiones físicas con gran precisión. Complementa al flujo digital cuando hay modelos físicos.',
    emoji: '🖥️',
  ),
  _QuizQuestion(
    question: '¿Qué ventaja económica ofrece AldraScan para adquirir sus equipos?',
    options: [
      'Solo acepta pago al contado en efectivo',
      'Financiación hasta 60 meses con cuotas accesibles',
      'Alquiler mensual sin opción de compra',
      'Solo disponible para hospitales públicos',
    ],
    correctIndex: 1,
    explanation: 'AldraScan ofrece financiación flexible hasta 60 meses, haciendo accesible la tecnología digital para clínicas de todos los tamaños sin una inversión inicial muy alta.',
    emoji: '💰',
  ),
  _QuizQuestion(
    question: '¿Qué es el "AldraScan Pro Dental Ecosystem"?',
    options: [
      'Una aplicación de redes sociales para dentistas',
      'Un ecosistema integrado de tecnología dental: escáneres, CBCT, fresadoras, impresoras 3D y software conectados',
      'Una marca de instrumentos manuales de odontología',
      'Un programa de seguros dentales',
    ],
    correctIndex: 1,
    explanation: 'AldraScan Pro Dental Ecosystem es la solución completa: todos los equipos y software están diseñados para trabajar juntos, desde la digitalización del paciente hasta la entrega de la restauración final.',
    emoji: '🌐',
  ),
];

// ─── Pantalla principal del Quiz ────────────────────────────────────────────────

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  int _currentQuestion = 0;
  int? _selectedAnswer;
  bool _answered = false;
  int _score = 0;
  bool _finished = false;

  late AnimationController _progressController;
  late AnimationController _cardController;
  late Animation<double> _cardAnim;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _cardAnim = CurvedAnimation(parent: _cardController, curve: Curves.easeOut);
    _cardController.forward();
    _updateProgress();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    _progressController.animateTo(
      (_currentQuestion) / _questions.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _selectAnswer(int index) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = index;
      _answered = true;
      if (index == _questions[_currentQuestion].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _answered = false;
      });
      _cardController.reset();
      _cardController.forward();
      _updateProgress();
    } else {
      setState(() => _finished = true);
      _progressController.animateTo(1.0);
    }
  }

  void _restart() {
    setState(() {
      _currentQuestion = 0;
      _selectedAnswer = null;
      _answered = false;
      _score = 0;
      _finished = false;
    });
    _cardController.reset();
    _cardController.forward();
    _updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Quiz Dental'),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppTheme.divider),
        ),
      ),
      body: _finished ? _buildResults() : _buildQuiz(),
    );
  }

  // ── Quiz en progreso ────────────────────────────────────────────────────────

  Widget _buildQuiz() {
    final q = _questions[_currentQuestion];
    return Column(
      children: [
        // ── Barra de progreso ──
        _buildProgressBar(),
        // ── Contenido ──
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: FadeTransition(
              opacity: _cardAnim,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.05, 0),
                  end: Offset.zero,
                ).animate(_cardAnim),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Número pregunta
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Pregunta ${_currentQuestion + 1} de ${_questions.length}',
                            style: const TextStyle(
                              color: AppTheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (q.emoji != null)
                          Text(q.emoji!, style: const TextStyle(fontSize: 24)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Pregunta
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.divider),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        q.question,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Opciones
                    ...List.generate(q.options.length, (i) => _buildOption(i, q)),
                    // Explicación
                    if (_answered) ...[
                      const SizedBox(height: 16),
                      _buildExplanation(q),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _nextQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            _currentQuestion < _questions.length - 1
                                ? 'Siguiente pregunta →'
                                : 'Ver resultados 🏆',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Container(
      color: AppTheme.surface,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_currentQuestion + 1}/${_questions.length}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded, size: 14, color: Color(0xFFFFA000)),
                  const SizedBox(width: 4),
                  Text(
                    '$_score aciertos',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _progressController,
            builder: (ctx, _) => ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: _progressController.value,
                backgroundColor: AppTheme.divider,
                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(int index, _QuizQuestion q) {
    Color borderColor = AppTheme.divider;
    Color bgColor = AppTheme.surface;
    Color textColor = AppTheme.textPrimary;
    Widget? trailingIcon;

    if (_answered) {
      if (index == q.correctIndex) {
        borderColor = const Color(0xFF2E7D32);
        bgColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF1B5E20);
        trailingIcon = const Icon(Icons.check_circle, color: Color(0xFF2E7D32), size: 20);
      } else if (index == _selectedAnswer) {
        borderColor = const Color(0xFFC62828);
        bgColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFB71C1C);
        trailingIcon = const Icon(Icons.cancel, color: Color(0xFFC62828), size: 20);
      } else {
        borderColor = AppTheme.divider;
        bgColor = const Color(0xFFFAFAFA);
        textColor = AppTheme.textHint;
      }
    } else if (_selectedAnswer == index) {
      borderColor = AppTheme.primary;
      bgColor = AppTheme.primary.withValues(alpha: 0.05);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: _answered ? null : () => _selectAnswer(index),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Row(
            children: [
              // Indicador letra
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: _answered
                      ? (index == q.correctIndex
                          ? const Color(0xFF2E7D32)
                          : (index == _selectedAnswer
                              ? const Color(0xFFC62828)
                              : AppTheme.divider))
                      : AppTheme.divider,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: _answered && (index == q.correctIndex || index == _selectedAnswer)
                          ? Colors.white
                          : AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  q.options[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    height: 1.3,
                  ),
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 8),
                trailingIcon,
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation(_QuizQuestion q) {
    final isCorrect = _selectedAnswer == q.correctIndex;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color(0xFFE8F5E9)
            : const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect
              ? const Color(0xFF66BB6A)
              : const Color(0xFFFFB300),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCorrect ? '✅' : '💡',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCorrect ? '¡Correcto!' : 'La respuesta correcta es la ${String.fromCharCode(65 + q.correctIndex)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: isCorrect
                        ? const Color(0xFF1B5E20)
                        : const Color(0xFFE65100),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  q.explanation,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textPrimary,
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

  // ── Resultados finales ──────────────────────────────────────────────────────

  Widget _buildResults() {
    final pct = (_score / _questions.length * 100).round();
    final String level;
    final String levelEmoji;
    final Color levelColor;
    final String message;
    final String whatsappMsg;

    if (pct >= 90) {
      level = 'Experto Digital';
      levelEmoji = '🏆';
      levelColor = const Color(0xFFFFA000);
      message = '¡Impresionante! Dominas el ecosistema de tecnología dental. Estás listo para digitalizar tu clínica al máximo nivel.';
      whatsappMsg = 'He conseguido $_score/${_questions.length} en el Quiz de AldraScan. Soy un Experto Digital 🏆 ¡Me gustaría conocer más sobre los equipos!';
    } else if (pct >= 70) {
      level = 'Avanzado';
      levelEmoji = '⭐';
      levelColor = AppTheme.primary;
      message = '¡Muy bien! Tienes un sólido conocimiento de la tecnología dental digital. Un par de áreas más y lo dominarás todo.';
      whatsappMsg = 'He conseguido $_score/${_questions.length} en el Quiz de AldraScan. Nivel Avanzado ⭐ ¡Me gustaría saber más!';
    } else if (pct >= 50) {
      level = 'En formación';
      levelEmoji = '📚';
      levelColor = const Color(0xFF00ACC1);
      message = 'Buen comienzo. El mundo digital dental tiene mucho que ofrecerte. AldraScan puede ayudarte a dar el salto.';
      whatsappMsg = 'He hecho el Quiz de AldraScan y me gustaría recibir más información sobre tecnología dental digital.';
    } else {
      level = 'Principiante';
      levelEmoji = '🌱';
      levelColor = const Color(0xFF66BB6A);
      message = 'Todos empezamos desde cero. La tecnología dental digital puede transformar tu práctica. ¡Descúbrela con AldraScan!';
      whatsappMsg = 'Me gustaría información sobre cómo digitalizar mi clínica con AldraScan.';
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
      child: Column(
        children: [
          // ── Trofeo / resultado ──
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primary,
                  AppTheme.primaryLight,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(levelEmoji, style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 12),
                Text(
                  level,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$_score de ${_questions.length} respuestas correctas',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                // Puntuación circular
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$pct%',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // ── Mensaje ──
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.divider),
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textPrimary,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // ── Estadísticas ──
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Correctas',
                  value: '$_score',
                  color: const Color(0xFF2E7D32),
                  icon: Icons.check_circle_outline,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  label: 'Errores',
                  value: '${_questions.length - _score}',
                  color: const Color(0xFFC62828),
                  icon: Icons.cancel_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  label: 'Nivel',
                  value: levelEmoji,
                  color: levelColor,
                  icon: Icons.emoji_events_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // ── Botón WhatsApp ──
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => openUrl(
                whatsAppUrl(
                  '34662078540',
                  whatsappMsg,
                ),
              ),
              icon: const Icon(Icons.chat, size: 20),
              label: const Text(
                'Hablar con un experto AldraScan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.whatsapp,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // ── Botón repetir ──
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _restart,
              icon: const Icon(Icons.refresh_rounded, size: 20),
              label: const Text(
                'Repetir quiz',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primary,
                side: const BorderSide(color: AppTheme.primary, width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // ── Tip final ──
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.lightbulb_outline, color: AppTheme.primary, size: 18),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Visita el Catálogo para descubrir todos los equipos y precios Expodental 2026.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.primary,
                      height: 1.4,
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
}

// ─── Widget auxiliar para estadísticas ──────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
