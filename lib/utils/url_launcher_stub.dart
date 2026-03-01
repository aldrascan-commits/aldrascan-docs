// Stub — nunca se usa en producción
import 'package:url_launcher/url_launcher.dart';

void openUrlPlatform(String url) {
  launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}

void downloadBytesAsFile(List<int> bytes, String fileName) {
  // No-op en stub
}
