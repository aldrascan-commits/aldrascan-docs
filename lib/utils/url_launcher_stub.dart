// Stub — nunca se usa en producción, solo para análisis estático
// El import condicional selecciona web o native automáticamente
import 'package:url_launcher/url_launcher.dart';

void openUrlPlatform(String url) {
  launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}
