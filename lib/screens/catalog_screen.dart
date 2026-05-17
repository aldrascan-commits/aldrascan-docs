import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/dashboard_catalog.dart';
import '../theme/app_theme.dart';
import '../widgets/dashboard_product_card.dart';
import 'dashboard_product_detail_screen.dart';

/// Catálogo unificado basado 100% en [DashboardCatalog] (117 SKUs reales).
/// Conserva la UX clásica: chips de categoría arriba + grid de cards.
/// Acepta [initialCategory] con IDs legacy (scanner, fresadora, cbct, etc.)
/// gracias a un mapeo interno.
class CatalogScreen extends StatefulWidget {
  final String? initialCategory;
  const CatalogScreen({super.key, this.initialCategory});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with SingleTickerProviderStateMixin {
  // 'all' => mostrar todo
  String _selectedCategory = 'all';
  String _query = '';
  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  bool _searchFocused = false;
  late final AnimationController _listAnim;

  /// Mapeo de IDs legacy → IDs reales del DashboardCatalog.
  /// Permite que home_screen siga llamando con 'fresadora', 'cbct', etc.
  static const Map<String, String> _legacyIdMap = {
    'fresadora': 'mill',
    'cbct': 'xray',
    'cadcam': 'material',
    'sillon': 'unit',
    'impresora': 'printer',
    // ids que ya coinciden: 'scanner', 'pack', 'soft', 'fotogram', 'other'
  };

  String _normalizeCatId(String id) => _legacyIdMap[id] ?? id;

  @override
  void initState() {
    super.initState();
    if (widget.initialCategory != null) {
      _selectedCategory = _normalizeCatId(widget.initialCategory!);
    }
    _listAnim = AnimationController(
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
    _listAnim.dispose();
    super.dispose();
  }

  List<DashboardProduct> get _filtered {
    final q = _query.trim().toLowerCase();
    return DashboardCatalog.products.where((p) {
      if (_selectedCategory != 'all' && p.cat != _selectedCategory) {
        return false;
      }
      if (q.isEmpty) return true;
      return p.name.toLowerCase().contains(q) ||
          p.sub.toLowerCase().contains(q) ||
          p.id.toLowerCase().contains(q);
    }).toList();
  }

  void _selectCategory(String id) {
    HapticFeedback.selectionClick();
    setState(() => _selectedCategory = id);
    _listAnim
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filtered;
    final totalSkus = DashboardCatalog.products.length;
    final brands = DashboardCatalog.brands.length;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Text(
              'Catálogo',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppTheme.textPrimary,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$totalSkus SKUs',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppTheme.divider),
        ),
      ),
      body: Column(
        children: [
          // ── Search ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _searchFocused
                      ? AppTheme.primary
                      : AppTheme.divider,
                  width: _searchFocused ? 1.6 : 1,
                ),
                boxShadow: _searchFocused
                    ? [
                        BoxShadow(
                          color: AppTheme.primary.withValues(alpha: 0.10),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: TextField(
                controller: _searchCtrl,
                focusNode: _searchFocus,
                onChanged: (v) => setState(() => _query = v),
                style: GoogleFonts.inter(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Buscar producto, marca, ref…',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.textHint,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: _searchFocused
                        ? AppTheme.primary
                        : AppTheme.textHint,
                    size: 20,
                  ),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded, size: 18),
                          onPressed: () {
                            _searchCtrl.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  filled: false,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 14),
                ),
              ),
            ),
          ),

          // ── Chips de categoría ─────────────────────────────────────
          SizedBox(
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _CategoryChip(
                  icon: '🔍',
                  label: 'Todos',
                  selected: _selectedCategory == 'all',
                  onTap: () => _selectCategory('all'),
                ),
                for (final c in DashboardCatalog.categories)
                  _CategoryChip(
                    icon: c.icon,
                    label: c.label,
                    color: c.color,
                    selected: _selectedCategory == c.id,
                    onTap: () => _selectCategory(c.id),
                  ),
              ],
            ),
          ),

          // ── Stats bar ──────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Row(
              children: [
                Icon(Icons.inventory_2_outlined,
                    size: 13, color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Text(
                  '${products.length} ${products.length == 1 ? "resultado" : "resultados"}',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: AppTheme.textHint,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$brands marcas · $totalSkus SKUs totales',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppTheme.textHint,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // ── Grid ───────────────────────────────────────────────────
          Expanded(
            child: products.isEmpty
                ? _EmptyState(query: _query)
                : FadeTransition(
                    opacity: _listAnim,
                    child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.66,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: products.length,
                      itemBuilder: (ctx, i) {
                        final p = products[i];
                        return DashboardProductCard(
                          product: p,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DashboardProductDetailScreen(product: p),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Chip de categoría ────────────────────────────────────────────────
class _CategoryChip extends StatelessWidget {
  final String icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? color;

  const _CategoryChip({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppTheme.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? c : AppTheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? c : AppTheme.divider,
              width: 1,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: c.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(icon, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Empty state ──────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final String query;
  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🔎', style: TextStyle(fontSize: 56)),
          const SizedBox(height: 12),
          Text(
            query.isNotEmpty
                ? 'Sin resultados para "$query"'
                : 'Sin productos en esta categoría',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Prueba con otra marca o categoría',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.textHint,
            ),
          ),
        ],
      ),
    );
  }
}
