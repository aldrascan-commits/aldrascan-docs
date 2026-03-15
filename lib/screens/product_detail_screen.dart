import 'package:flutter/material.dart';
import '../utils/url_helper.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _entryController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late PageController _imagePageCtrl;

  @override
  void initState() {
    super.initState();
    _imagePageCtrl = PageController();
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(parent: _entryController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entryController, curve: Curves.easeOutCubic));
    _entryController.forward();
  }

  @override
  void dispose() {
    _imagePageCtrl.dispose();
    _entryController.dispose();
    super.dispose();
  }

  Future<void> _openWhatsApp() async => openUrl(widget.product.whatsappUrl);
  Future<void> _callPhone() async => openUrl(telUrl('+34662078540'));

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isScanner = product.category == 'scanner';

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: Stack(
        children: [
          // ── Scroll principal ─────────────────────────────────────────────
          CustomScrollView(
            slivers: [
              // ── App Bar con imagen / galería ───────────────────────────
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppTheme.surface,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: AppTheme.textPrimary, size: 20),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Galería PageView
                      PageView.builder(
                        controller: _imagePageCtrl,
                        itemCount: 1,
                        onPageChanged: (_) {},
                        itemBuilder: (_, __) => Image.asset(
                          product.imageAsset,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: AppTheme.background,
                            child: const Icon(Icons.image_outlined,
                                size: 80, color: AppTheme.textHint),
                          ),
                        ),
                      ),
                      // Gradiente inferior
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                AppTheme.surface,
                                AppTheme.surface.withValues(alpha: 0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Badge categoría
                      Positioned(
                        top: 60,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.badgeColor(product.badge),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.badgeColor(product.badge)
                                    .withValues(alpha: 0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            product.badge ?? _categoryLabel(product.category),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Contenido principal ───────────────────────────────────────
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Categoría pill
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              _categoryLabel(product.category),
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppTheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Nombre del producto
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textPrimary,
                              height: 1.2,
                            ),
                          ),

                          if (product.subtitle != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              product.subtitle!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppTheme.textSecondary,
                                height: 1.4,
                              ),
                            ),
                          ],

                          const SizedBox(height: 16),

                          // ── Precio / CTA ──────────────────────────────────
                          if (isScanner) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFE65100), Color(0xFFFFA000)],
                                ),
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFE65100)
                                        .withValues(alpha: 0.35),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.local_offer_outlined,
                                      size: 22, color: Colors.white),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Solicita tu Oferta',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Precio personalizado para tu clínica',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ] else if (product.price != null) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  product.formattedPrice,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.primary,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 4, left: 4),
                                  child: Text(
                                    '+ IVA',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            const Text(
                              'Precio a consultar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],

                          // Financiación
                          if (product.category != 'scanner' &&
                              product.financing != null) ...[
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0xFFA5D6A7)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.credit_card_outlined,
                                      size: 16, color: AppTheme.badgeGreen),
                                  const SizedBox(width: 8),
                                  Text(
                                    product.financing!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.badgeGreen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          const SizedBox(height: 24),
                          _Divider(),
                          const SizedBox(height: 20),

                          // ── Descripción ────────────────────────────────────
                          _SectionTitle(icon: Icons.info_outline, title: 'Descripción'),
                          const SizedBox(height: 10),
                          Text(
                            product.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                              height: 1.7,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // ── Características ────────────────────────────────
                          _SectionTitle(
                              icon: Icons.check_circle_outline,
                              title: 'Características incluidas'),
                          const SizedBox(height: 12),
                          ...product.features.asMap().entries.map(
                            (entry) => _FeatureRow(
                              text: entry.value,
                              index: entry.key,
                            ),
                          ),

                          const SizedBox(height: 24),
                          _Divider(),
                          const SizedBox(height: 20),

                          // ── Bloque contacto ────────────────────────────────
                          Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: AppTheme.background,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppTheme.divider),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '¿Interesado en este producto?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Nuestro equipo te asesora sin compromiso',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton.icon(
                                        onPressed: _openWhatsApp,
                                        icon: const Icon(
                                            Icons.chat_outlined, size: 16),
                                        label: const Text('WhatsApp',
                                            style: TextStyle(fontSize: 13)),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppTheme.whatsapp,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 13),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 2,
                                      child: OutlinedButton.icon(
                                        onPressed: _callPhone,
                                        icon: const Icon(Icons.phone_outlined,
                                            size: 16, color: AppTheme.primary),
                                        label: const Text('Llamar',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppTheme.primary)),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: AppTheme.primary),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 13),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ── Botón WhatsApp sticky flotante ───────────────────────────────
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: SafeArea(
              child: GestureDetector(
                onTap: _openWhatsApp,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1B5E20), AppTheme.whatsapp],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.whatsapp.withValues(alpha: 0.45),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.chat_rounded,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        isScanner
                            ? 'Solicitar oferta personalizada'
                            : 'Solicitar información por WhatsApp',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _categoryLabel(String cat) {
    switch (cat) {
      case 'scanner':    return '📷 Escáner Intraoral';
      case 'cbct':       return '🔬 CBCT 3D';
      case 'sillon':     return '🦷 Sillón Dental';
      case 'fresadora':  return '⚙️ Fresadora';
      case 'impresora':  return '🖨️ Impresora 3D';
      case 'cadcam':     return '🏭 CAD/CAM';
      case 'pack':       return '📦 Pack';
      default:           return cat;
    }
  }
}

// ── Helpers visuales ──────────────────────────────────────────────────────────
class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Divider(color: AppTheme.divider, thickness: 1);
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppTheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String text;
  final int index;
  const _FeatureRow({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            margin: const EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_rounded,
                size: 13, color: AppTheme.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13.5,
                color: AppTheme.textPrimary,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
