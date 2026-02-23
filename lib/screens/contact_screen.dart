import 'package:flutter/material.dart';
import '../utils/url_helper.dart';
import '../theme/app_theme.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launch(String url) async => openUrl(url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Contacto'),
        backgroundColor: AppTheme.surface,
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
            // ── Header ────────────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, AppTheme.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.scanner,
                        color: Colors.white, size: 28),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'AldraScan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tecnología dental de vanguardia\npara profesionales',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Contacto directo ──────────────────────────────────────────
            const Text(
              'Contacto directo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            _ContactTile(
              icon: Icons.chat_outlined,
              iconColor: AppTheme.whatsapp,
              bgColor: const Color(0xFFE8F5E9),
              title: 'WhatsApp',
              subtitle: '+34 662 078 540',
              label: 'Enviar mensaje',
              onTap: () => _launch(
                'https://wa.me/34662078540?text=Hola,%20me%20gustar%C3%ADa%20recibir%20informaci%C3%B3n%20sobre%20sus%20productos',
              ),
            ),
            const SizedBox(height: 10),
            _ContactTile(
              icon: Icons.phone_outlined,
              iconColor: AppTheme.primary,
              bgColor: const Color(0xFFE3F2FD),
              title: 'Teléfono',
              subtitle: '+34 662 078 540',
              label: 'Llamar ahora',
              onTap: () => _launch('tel:+34662078540'),
            ),

            const SizedBox(height: 24),

            // ── Horario ────────────────────────────────────────────────────
            const Text(
              'Horario de atención',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.divider),
              ),
              child: const Column(
                children: [
                  _HourRow('Lunes – Viernes', '9:00 – 19:00'),
                  Divider(height: 20, color: AppTheme.divider),
                  _HourRow('Sábados', '9:00 – 14:00'),
                  Divider(height: 20, color: AppTheme.divider),
                  _HourRow('Domingos', 'Cerrado'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Sobre nosotros ─────────────────────────────────────────────
            const Text(
              'Sobre AldraScan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.divider),
              ),
              child: const Text(
                'Somos especialistas en tecnología dental de vanguardia. '
                'Ofrecemos escáneres intraorales, equipos CBCT 3D, sillones '
                'dentales y fresadoras de las mejores marcas del mercado: '
                'Medit, Meyer, Rayscan, Shining 3D y más.\n\n'
                'Nuestro compromiso es acompañarte en la digitalización '
                'de tu clínica con formación completa, soporte técnico '
                'y las mejores condiciones de financiación.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Marcas ─────────────────────────────────────────────────────
            const Text(
              'Marcas que distribuimos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                'Medit', 'Meyer', 'Rayscan', 'Shining 3D',
                'Panda', 'Craft', 'AldraScan Pro',
              ]
                  .map((brand) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.divider),
                        ),
                        child: Text(
                          brand,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final String label;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.divider),
      ),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary)),
        subtitle: Text(subtitle,
            style: const TextStyle(
                fontSize: 12, color: AppTheme.textSecondary)),
        trailing: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}

class _HourRow extends StatelessWidget {
  final String day;
  final String hours;
  const _HourRow(this.day, this.hours);

  @override
  Widget build(BuildContext context) {
    final isClosed = hours == 'Cerrado';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(day,
            style: const TextStyle(
                fontSize: 13, color: AppTheme.textSecondary)),
        Text(
          hours,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isClosed ? Colors.red[400] : AppTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}
