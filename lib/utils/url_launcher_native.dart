// Implementación NATIVA (Android/iOS nativo)
import 'package:url_launcher/url_launcher.dart';

void openUrlPlatform(String url) {
  launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}

void downloadBytesAsFile(List<int> bytes, String fileName) {
  // En nativo la descarga se maneja por openUrlPlatform con URL remota
}
