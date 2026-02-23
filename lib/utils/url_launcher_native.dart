// Implementación NATIVA (Android/iOS nativo)
// Este archivo se compila cuando el target NO es web
import 'package:url_launcher/url_launcher.dart';

void openUrlPlatform(String url) {
  final uri = Uri.parse(url);
  launchUrl(uri, mode: LaunchMode.externalApplication);
}
