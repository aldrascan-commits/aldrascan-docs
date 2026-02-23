class ProductCategory {
  final String id;
  final String name;
  final String icon;

  const ProductCategory({
    required this.id,
    required this.name,
    required this.icon,
  });

  static const all = ProductCategory(id: 'all', name: 'Todos', icon: '🔍');
  static const scanners = ProductCategory(id: 'scanner', name: 'Escáneres', icon: '📷');
  static const packs = ProductCategory(id: 'pack', name: 'Packs', icon: '📦');
  static const milling = ProductCategory(id: 'fresadora', name: 'Fresadoras', icon: '⚙️');
  static const printers = ProductCategory(id: 'impresora', name: 'Impresoras 3D', icon: '🖨️');
  static const cbct = ProductCategory(id: 'cbct', name: 'CBCT 3D', icon: '🔬');

  static List<ProductCategory> get categories => [
    all, scanners, packs, milling, printers, cbct,
  ];
}
