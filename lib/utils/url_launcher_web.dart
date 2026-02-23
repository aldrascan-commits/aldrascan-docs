// Implementación WEB: usa package:web + dart:js_interop
// Este archivo solo se compila cuando el target es web (dart.library.html)
//
// POR QUÉ window.location.href para iOS:
// - iOS Safari PWA bloquea window.open() y launchUrl() de Flutter
//   cuando no vienen de un gesto directo del navegador
// - window.location.href = url  funciona SIEMPRE en iOS Safari
//   porque asigna la URL síncronamente en el mismo event handler del tap
// - Para wa.me: iOS abre WhatsApp directamente si está instalado,
//   o la web de WhatsApp si no lo está
import 'package:web/web.dart' as web;

void openUrlPlatform(String url) {
  if (url.startsWith('tel:') ||
      url.startsWith('whatsapp:') ||
      url.contains('wa.me')) {
    // Para tel: y WhatsApp: navegamos directamente en la misma ventana
    // iOS intercepta tel: y wa.me y abre la app del sistema
    web.window.location.href = url;
  } else {
    // Para otros https: abrimos en nueva pestaña (Mac/Android/Chrome)
    // En iOS Safari PWA se abre en Safari externo
    web.window.open(url, '_blank', '');
  }
}
