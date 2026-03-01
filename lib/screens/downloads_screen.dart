import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  // Lista de documentos disponibles
  static const _docs = [
    _DocItem(
      title: 'Catálogo Expodental 2026',
      subtitle: 'Lista completa de precios y equipos AldraScan',
      description:
          'Escáneres intraorales, CBCT, fresadoras, impresoras 3D y packs '
          'con precios especiales para Expodental 2026. Financiación hasta 60 meses.',
      assetPath: 'assets/docs/aldrascan_expodental_precios.pdf',
      fileName: 'AldraScan_Expodental_Precios_2026.pdf',
      sizeMb: '11.4 MB',
      pages: '8 págs.',
      icon: Icons.picture_as_pdf_outlined,
      color: Color(0xFFE53935),
    ),
    _DocItem(
      title: 'AldraScan Pro – Ecosistema Dental',
      subtitle: 'Ecosistema completo de tecnología dental digital',
      description:
          'Descubre el flujo de trabajo digital completo: escáneres intraorales, '
          'CBCT, fresadoras CAD/CAM, impresoras 3D y software integrado. '
          'Todo lo que necesitas para digitalizar tu clínica o laboratorio.',
      assetPath: 'assets/docs/aldrascan_pro_ecosystem.pdf',
      fileName: 'AldraScan_Pro_Dental_Ecosystem.pdf',
      sizeMb: '4.3 MB',
      pages: 'Dossier completo',
      icon: Icons.biotech_outlined,
      color: Color(0xFF1565C0),
    ),
    _DocItem(
      title: 'AldraScan CAD CAM',
      subtitle: 'Fresadoras y flujo CAD/CAM para clínica y laboratorio',
      description:
          'Catálogo completo de soluciones CAD/CAM: fresadoras de alta precisión, '
          'bloques de zirconio, cerámica y PMMA. Diseño y fabricación de coronas, '
          'puentes e inlays en el mismo día. Flujo digital integrado.',
      assetPath: 'assets/docs/aldrascan_cad_cam.pdf',
      fileName: 'AldraScan_CAD_CAM.pdf',
      sizeMb: '3.4 MB',
      pages: 'Catálogo CAD/CAM',
      icon: Icons.precision_manufacturing_outlined,
      color: Color(0xFF00897B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Descargas'),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppTheme.divider),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ─────────────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, AppTheme.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.download_rounded,
                        color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Documentación AldraScan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Descarga catálogos y listas de precios',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Documentos disponibles',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            // ── Lista de documentos ─────────────────────────────────────────
            ..._docs.map((doc) => _DocCard(doc: doc)),

            const SizedBox(height: 24),

            // ── Nota informativa ────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFE082)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline,
                      color: Color(0xFFF9A825), size: 20),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Los precios indicados en el catálogo son '
                      'precios especiales para Expodental 2026. '
                      'Contacta con nosotros para confirmar disponibilidad '
                      'y condiciones de financiación.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5D4037),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Contacto rápido ─────────────────────────────────────────────
            GestureDetector(
              onTap: () => openUrl(
                  'https://wa.me/34662078540?text=Hola%2C%20he%20descargado%20el%20cat%C3%A1logo%20y%20me%20gustar%C3%ADa%20recibir%20m%C3%A1s%20informaci%C3%B3n'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFA5D6A7)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.whatsapp,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.chat_outlined,
                          color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '¿Tienes alguna pregunta sobre el catálogo?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          Text(
                            'Escríbenos por WhatsApp',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppTheme.whatsapp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        size: 14, color: AppTheme.textHint),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─── Tarjeta de documento ──────────────────────────────────────────────────────
class _DocCard extends StatefulWidget {
  final _DocItem doc;
  const _DocCard({required this.doc});

  @override
  State<_DocCard> createState() => _DocCardState();
}

class _DocCardState extends State<_DocCard> {
  bool _downloading = false;

  Future<void> _downloadPdf() async {
    setState(() => _downloading = true);

    try {
      if (kIsWeb) {
        // En web: cargar el asset como bytes y disparar descarga via JS
        final byteData = await rootBundle.load(widget.doc.assetPath);
        final bytes = byteData.buffer.asUint8List();
        // Llama función JS que hace el Blob download
        downloadBytesAsFile(bytes, widget.doc.fileName);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Text('Descargando ${widget.doc.fileName}'),
                ],
              ),
              backgroundColor: AppTheme.whatsapp,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } else {
        // En Android: abrir PDF con url_launcher
        await openUrl(
            'https://aldrascan.com/docs/${widget.doc.fileName}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al descargar. Inténtalo de nuevo.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final doc = widget.doc;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Cabecera ──────────────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: doc.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(doc.icon, color: doc.color, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        doc.subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ── Descripción ───────────────────────────────────────────────
            Text(
              doc.description,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            // ── Metadatos ─────────────────────────────────────────────────
            Row(
              children: [
                _MetaBadge(Icons.description_outlined, 'PDF'),
                const SizedBox(width: 8),
                _MetaBadge(Icons.storage_outlined, doc.sizeMb),
                const SizedBox(width: 8),
                _MetaBadge(Icons.auto_stories_outlined, doc.pages),
              ],
            ),

            const SizedBox(height: 14),

            // ── Botón descarga ────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _downloading ? null : _downloadPdf,
                icon: _downloading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.download_rounded, size: 18),
                label: Text(
                  _downloading ? 'Descargando...' : 'Descargar PDF',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Badge de metadato ─────────────────────────────────────────────────────────
class _MetaBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaBadge(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppTheme.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Modelo de documento ───────────────────────────────────────────────────────
class _DocItem {
  final String title;
  final String subtitle;
  final String description;
  final String assetPath;
  final String fileName;
  final String sizeMb;
  final String pages;
  final IconData icon;
  final Color color;

  const _DocItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.assetPath,
    required this.fileName,
    required this.sizeMb,
    required this.pages,
    required this.icon,
    required this.color,
  });
}
