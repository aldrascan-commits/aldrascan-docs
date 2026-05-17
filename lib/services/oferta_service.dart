import 'package:flutter/foundation.dart';
import '../data/dashboard_catalog.dart';

/// Línea de oferta: producto + cantidad + descuento opcional sobre PVP.
class OfertaLine {
  final DashboardProduct product;
  int qty;
  double discountPct; // % sobre PVP

  OfertaLine({
    required this.product,
    this.qty = 1,
    this.discountPct = 0,
  });

  double get coste     => product.coste * qty;
  double get pvdTotal  => product.pvd * qty;
  double get pvpBase   => product.pvp * qty;
  double get pvpFinal  => pvpBase * (1 - discountPct / 100);
  double get descuentoEur => pvpBase - pvpFinal;
}

/// Servicio compartido para Constructor de Ofertas y Simulador de Packs.
class OfertaService extends ChangeNotifier {
  final List<OfertaLine> _lines = [];
  double _packDiscount = 5;  // % descuento conjunto (modo pack)
  int    _ivaPct       = 21; // %

  // ── Getters ─────────────────────────────────────────────────────────
  List<OfertaLine> get lines        => List.unmodifiable(_lines);
  int             get count        => _lines.length;
  bool            get isEmpty      => _lines.isEmpty;
  double          get packDiscount => _packDiscount;
  int             get ivaPct       => _ivaPct;

  // ── Mutadores ───────────────────────────────────────────────────────
  void add(DashboardProduct p, {int qty = 1, double discountPct = 0}) {
    final i = _lines.indexWhere((l) => l.product.id == p.id);
    if (i >= 0) {
      _lines[i].qty += qty;
    } else {
      _lines.add(OfertaLine(product: p, qty: qty, discountPct: discountPct));
    }
    notifyListeners();
  }

  void remove(String productId) {
    _lines.removeWhere((l) => l.product.id == productId);
    notifyListeners();
  }

  void setQty(String productId, int qty) {
    final i = _lines.indexWhere((l) => l.product.id == productId);
    if (i < 0) return;
    if (qty <= 0) {
      _lines.removeAt(i);
    } else {
      _lines[i].qty = qty;
    }
    notifyListeners();
  }

  void setLineDiscount(String productId, double pct) {
    final i = _lines.indexWhere((l) => l.product.id == productId);
    if (i < 0) return;
    _lines[i].discountPct = pct.clamp(0.0, 100.0);
    notifyListeners();
  }

  void toggle(DashboardProduct p) {
    final i = _lines.indexWhere((l) => l.product.id == p.id);
    if (i >= 0) {
      _lines.removeAt(i);
    } else {
      _lines.add(OfertaLine(product: p));
    }
    notifyListeners();
  }

  bool contains(String productId) =>
      _lines.any((l) => l.product.id == productId);

  void setPackDiscount(double pct) {
    _packDiscount = pct.clamp(0.0, 99.9);
    notifyListeners();
  }

  void setIva(int pct) {
    _ivaPct = pct;
    notifyListeners();
  }

  void clear() {
    _lines.clear();
    notifyListeners();
  }

  // ── Cálculos ───────────────────────────────────────────────────────
  double get totalCoste    => _lines.fold(0, (s, l) => s + l.coste);
  double get totalPvd      => _lines.fold(0, (s, l) => s + l.pvdTotal);
  double get pvpBruto      => _lines.fold(0, (s, l) => s + l.pvpBase);
  // PVP tras descuentos por línea
  double get pvpConLineas  => _lines.fold(0, (s, l) => s + l.pvpFinal);
  // PVP con descuento global tipo pack (sobre el bruto)
  double get pvpPackNeto   => pvpBruto * (1 - _packDiscount / 100);

  double get descuentoPack => pvpBruto - pvpPackNeto;
  double get pvpConIva     => pvpPackNeto * (1 + _ivaPct / 100);

  double get margenAbs     => pvpPackNeto - totalCoste;
  double get margenPct     =>
      totalCoste == 0 ? 0 : (margenAbs / totalCoste) * 100;
  double get margenPvdPvp  => pvpPackNeto - totalPvd;
  double get margenPvdPvpPct =>
      totalPvd == 0 ? 0 : (margenPvdPvp / totalPvd) * 100;
}
