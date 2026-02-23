import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Abre cualquier URL de forma compatible con:
/// - iOS Safari / PWA iPhone / PWA iPad
/// - Mac Safari
/// - Android nativo
/// - Navegadores de escritorio (Chrome, Firefox, Edge)
///
/// En web siempre usamos [launchUrl] con [LaunchMode.externalApplication]
/// y SIN llamar canLaunchUrl primero (en iOS canLaunchUrl devuelve false
/// incluso para URLs válidas por restricciones de seguridad de Safari).
Future<void> openUrl(String rawUrl) async {
  final uri = Uri.parse(rawUrl);

  if (kIsWeb) {
    // En web (PWA iPhone/iPad, Safari, Chrome...) usamos externalApplication
    // Esto abre WhatsApp, Safari, FaceTime, etc. desde la PWA
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (_) {
      // Si falla (muy raro), intentar con platformDefault
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {}
    }
  } else {
    // Android / iOS nativo
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {}
    }
  }
}

/// Genera URL de WhatsApp con texto preformateado
String whatsAppUrl(String phone, String text) {
  final encoded = Uri.encodeComponent(text);
  return 'https://wa.me/$phone?text=$encoded';
}

/// Genera URL de llamada telefónica
String telUrl(String phone) => 'tel:$phone';
