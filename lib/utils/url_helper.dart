// url_helper.dart — Import condicional web/nativo
import 'url_launcher_stub.dart'
    if (dart.library.html) 'url_launcher_web.dart'
    if (dart.library.io) 'url_launcher_native.dart';

export 'url_launcher_stub.dart'
    if (dart.library.html) 'url_launcher_web.dart'
    if (dart.library.io) 'url_launcher_native.dart'
    show openUrlPlatform, downloadBytesAsFile;

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
