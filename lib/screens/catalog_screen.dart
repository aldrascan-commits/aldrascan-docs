import 'package:flutter/material.dart';
import '../utils/url_helper.dart';
import '../data/products_data.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  final String? initialCategory;
  const CatalogScreen({super.key, this.initialCategory});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with SingleTickerProviderStateMixin {
  String _selectedCategory = 'all';
  String _searchQuery = '';
  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  bool _searchFocused = false;
  late AnimationController _listAnimCtrl;

  @override
  void initState() {
    super.initState();
    if (widget.initialCategory != null) {
      _selectedCategory = widget.initialCategory!;
    }
    _listAnimCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    )..forward();
    _searchFocus.addListener(() {
      setState(() => _searchFocused = _searchFocus.hasFocus);
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _searchFocus.dispose();
    _listAnimCtrl.dispose();
    super.dispose();
  }

  List<Product> get _filteredProducts {
    if (_searchQuery.isNotEmpty) return ProductData.search(_searchQuery);
    return ProductData.byCategory(_selectedCategory);
  }

  void _selectCategory(String id) {
    setState(() => _selectedCategory = id);
    _listAnimCtrl.reset();
    _listAnimCtrl.forward();
  }

  Future<void> _openWhatsApp(String url) async => openUrl(url);

  @override
  Widget build(BuildContext context) {
    final categories = ProductCategory.categories;
    final products = _filteredProducts;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        elevation: 0,
        title: const Text(
          'Catálogo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${ProductData.products.length} productos',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppTheme.divider),
        ),
      ),
      body: Column(
        children: [
          // ── Buscador premium ────────────────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              boxShadow: _searchFocused
                  ? [BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.08),
                      blurRadius: 12, offset: const Offset(0, 4))]
                  : [],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: TextField(
                controller: _searchCtrl,
                focusNode: _searchFocus,
                onChanged: (v) {
                  setState(() => _searchQuery = v);
                  _listAnimCtrl.reset();
                  _listAnimCtrl.forward();
                },
                decoration: InputDecoration(
                  hintText: '🔍  Buscar escáner, fresadora, CBCT...',
                  hintStyle: const TextStyle(color: AppTheme.textHint, fontSize: 13),
                  prefixIcon: const Icon(Icons.search_rounded,
                      color: AppTheme.textHint, size: 20),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.cancel_rounded,
                              size: 18, color: AppTheme.textHint),
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                              _searchCtrl.clear();
                            });
                            _listAnimCtrl.reset();
                            _listAnimCtrl.forward();
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),

          // ── Filtros de categoría ────────────────────────────────────────
          if (_searchQuery.isEmpty) ...[
            Container(
              color: AppTheme.surface,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (ctx, i) {
                        final cat = categories[i];
                        final isSelected = _selectedCategory == cat.id;
                        return GestureDetector(
                          onTap: () => _selectCategory(cat.id),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOutCubic,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppTheme.primary
                                  : AppTheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? AppTheme.primary
                                    : AppTheme.divider,
                              ),
                              boxShadow: isSelected
                                  ? [BoxShadow(
                                      color: AppTheme.primary.withValues(alpha: 0.25),
                                      blurRadius: 8, offset: const Offset(0, 3))]
                                  : [],
                            ),
                            child: Text(
                              '${cat.icon} ${cat.name}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : AppTheme.textSecondary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(height: 1, color: AppTheme.divider),
                ],
              ),
            ),
          ],

          // ── Header resultados ───────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
            child: Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    key: ValueKey(products.length),
                    '${products.length} producto${products.length != 1 ? 's' : ''}',
                    style: const TextStyle(
                      fontSize: 12, color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (_searchQuery.isNotEmpty) ...[
                  const SizedBox(width: 6),
                  Text('para "$_searchQuery"',
                    style: const TextStyle(
                      fontSize: 12, color: AppTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // ── Grid de productos ───────────────────────────────────────────
          Expanded(
            child: products.isEmpty
                ? _EmptyState(query: _searchQuery)
                : AnimatedBuilder(
                    animation: _listAnimCtrl,
                    builder: (_, child) => FadeTransition(
                      opacity: _listAnimCtrl,
                      child: child,
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: products.length,
                      itemBuilder: (ctx, i) => ProductCard(
                        product: products[i],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailScreen(product: products[i]),
                          ),
                        ),
                        onWhatsApp: () =>
                            _openWhatsApp(products[i].whatsappUrl),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String query;
  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppTheme.surfaceVariant,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.search_off_rounded,
                  size: 36, color: AppTheme.textHint),
            ),
            const SizedBox(height: 16),
            Text(
              query.isNotEmpty
                  ? 'Sin resultados para\n"$query"'
                  : 'Sin productos en esta categoría',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary, height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Prueba con otro término o categoría',
              style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
