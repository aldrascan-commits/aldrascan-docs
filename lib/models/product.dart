class Product {
  final String id;
  final String name;
  final String? subtitle;
  final String category;
  final double? price;
  final String? financing;
  final String description;
  final List<String> features;
  /// Ruta de asset local: 'assets/products/xxx.png'
  final String imageAsset;
  final String? badge;
  final bool isFeatured;
  final String whatsappNumber;
  final String whatsappMessage;

  const Product({
    required this.id,
    required this.name,
    this.subtitle,
    required this.category,
    this.price,
    this.financing,
    required this.description,
    required this.features,
    required this.imageAsset,
    this.badge,
    this.isFeatured = false,
    this.whatsappNumber = '34662078540',
    required this.whatsappMessage,
  });

  String get formattedPrice {
    if (price == null) return 'Consultar precio';
    final p = price!.toInt();
    final s = p.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '$s €';
  }

  String get whatsappUrl =>
      'https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(whatsappMessage)}';
}
