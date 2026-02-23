class Product {
  final String id;
  final String name;
  final String category;
  final double? price;
  final String? financing;
  final double? monthlyFee;
  final String? roi;
  final String? savings;
  final String description;
  final List<String> features;
  final String imageUrl;
  final String? badge;
  final bool isFeatured;
  final bool isExpodental;
  final String whatsappNumber;
  final String whatsappMessage;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    this.price,
    this.financing,
    this.monthlyFee,
    this.roi,
    this.savings,
    required this.description,
    required this.features,
    required this.imageUrl,
    this.badge,
    this.isFeatured = false,
    this.isExpodental = false,
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

  String get formattedMonthlyFee {
    if (monthlyFee == null) return '';
    return '${monthlyFee!.toInt()} €/mes';
  }

  String get whatsappUrl =>
      'https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(whatsappMessage)}';
}
