// Implementación WEB: usa package:web + dart:js_interop
import 'dart:js_interop';
import 'dart:typed_data';
import 'package:web/web.dart' as web;

void openUrlPlatform(String url) {
  if (url.startsWith('tel:') ||
      url.startsWith('whatsapp:') ||
      url.contains('wa.me')) {
    web.window.location.href = url;
  } else {
    web.window.open(url, '_blank', '');
  }
}

/// Descarga bytes como archivo en el navegador (Blob URL trick)
/// Funciona en Chrome, Safari, Firefox, Edge — incluyendo iOS Safari PWA
void downloadBytesAsFile(List<int> bytes, String fileName) {
  final uint8List = Uint8List.fromList(bytes);
  final jsArray = uint8List.toJS;
  final blob = web.Blob(
    [jsArray].toJS,
    web.BlobPropertyBag(type: 'application/pdf'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
  anchor.href = url;
  anchor.download = fileName;
  anchor.style.display = 'none';
  web.document.body!.appendChild(anchor);
  anchor.click();
  web.document.body!.removeChild(anchor);
  web.URL.revokeObjectURL(url);
}
