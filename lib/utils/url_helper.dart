// url_helper.dart — Import condicional web/nativo
// En web usa dart:html directamente (window.location.href / window.open)
// En nativo usa url_launcher con LaunchMode.externalApplication
//
// POR QUÉ ESTE ENFOQUE:
// - iOS Safari PWA bloquea launchUrl() de Flutter si no viene de
//   un gesto directo del navegador
// - dart:html window.location.href = url  funciona 100% en iOS Safari
//   porque se ejecuta síncronamente en el event handler del tap
// - Mac/Chrome/Android también funcionan con sus respectivas rutas

// ignore: uri_does_not_exist
import 'url_launcher_stub.dart'
    if (dart.library.html) 'url_launcher_web.dart'
    if (dart.library.io) 'url_launcher_native.dart';

export 'url_launcher_stub.dart'
    if (dart.library.html) 'url_launcher_web.dart'
    if (dart.library.io) 'url_launcher_native.dart'
    show openUrlPlatform;

/// Abre una URL de forma compatible con iOS Safari, PWA iPhone/iPad,
/// Mac Safari, Android y navegadores de escritorio.
Future<void> openUrl(String rawUrl) async {
  openUrlPlatform(rawUrl);
}

/// Genera URL de WhatsApp con texto preformateado
String whatsAppUrl(String phone, String text) {
  final encoded = Uri.encodeComponent(text);
  return 'https://wa.me/$phone?text=$encoded';
}

/// Genera URL de llamada telefónica
String telUrl(String phone) => 'tel:$phone';
