import 'package:shared_preferences/shared_preferences.dart';

/// Servicio singleton para gestionar el contador de descargas.
/// Persiste los datos en disco con shared_preferences.
/// Cada PDF tiene su propio contador + un contador global total.
class DownloadCounterService {
  DownloadCounterService._();
  static final DownloadCounterService instance = DownloadCounterService._();

  static const String _prefixKey = 'dl_count_';
  static const String _totalKey  = 'dl_count_total';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Incrementa el contador del documento [docId] y el total global.
  Future<void> increment(String docId) async {
    await init();
    final docCount  = (_prefs!.getInt('$_prefixKey$docId') ?? 0) + 1;
    final total     = (_prefs!.getInt(_totalKey) ?? 0) + 1;
    await _prefs!.setInt('$_prefixKey$docId', docCount);
    await _prefs!.setInt(_totalKey, total);
  }

  /// Devuelve el contador de un documento concreto.
  Future<int> getCount(String docId) async {
    await init();
    return _prefs!.getInt('$_prefixKey$docId') ?? 0;
  }

  /// Devuelve el total global de descargas.
  Future<int> getTotal() async {
    await init();
    return _prefs!.getInt(_totalKey) ?? 0;
  }

  /// Devuelve un mapa { docId → count } para todos los documentos conocidos.
  Future<Map<String, int>> getAllCounts(List<String> docIds) async {
    await init();
    final map = <String, int>{};
    for (final id in docIds) {
      map[id] = _prefs!.getInt('$_prefixKey$id') ?? 0;
    }
    return map;
  }
}
