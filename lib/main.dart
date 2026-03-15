import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/offers_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/downloads_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/expo_offers_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
  runApp(const AldraScanApp());
}

class AldraScanApp extends StatelessWidget {
  const AldraScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AldraScan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  String? _catalogCategory;
  late AnimationController _fabController;

  List<Widget> get _screens => [
    HomeScreen(onNavigateToCatalog: (cat) {
      setState(() {
        _catalogCategory = cat;
        _currentIndex = 1;
      });
    }),
    CatalogScreen(initialCategory: _catalogCategory),
    const ExpoOffersScreen(),
    const OffersScreen(),
    const QuizScreen(),
    const DownloadsScreen(),
    const ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  void _onTabTap(int index) {
    if (_currentIndex == index) return;
    HapticFeedback.selectionClick();
    _fabController.reset();
    if (index != 1) _catalogCategory = null;
    setState(() => _currentIndex = index);
    _fabController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: _PremiumBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTap,
        bottomPadding: bottomPadding,
      ),
    );
  }
}

// ── Navegación inferior premium ───────────────────────────────────────────────
class _PremiumBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double bottomPadding;

  const _PremiumBottomNav({
    required this.currentIndex,
    required this.onTap,
    required this.bottomPadding,
  });

  static const _items = [
    _NavItem(icon: Icons.home_outlined,     activeIcon: Icons.home_rounded,     label: 'Inicio'),
    _NavItem(icon: Icons.grid_view_outlined, activeIcon: Icons.grid_view_rounded, label: 'Catálogo'),
    _NavItem(icon: Icons.star_outline,      activeIcon: Icons.star_rounded,      label: 'Expo',    isSpecial: true),
    _NavItem(icon: Icons.local_offer_outlined, activeIcon: Icons.local_offer,    label: 'Ofertas'),
    _NavItem(icon: Icons.quiz_outlined,     activeIcon: Icons.quiz_rounded,      label: 'Quiz'),
    _NavItem(icon: Icons.download_outlined, activeIcon: Icons.download_rounded,  label: 'Recursos'),
    _NavItem(icon: Icons.headset_mic_outlined, activeIcon: Icons.headset_mic,    label: 'Contacto'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        boxShadow: AppTheme.bottomNavShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 1, color: AppTheme.divider.withValues(alpha: 0.6)),
          Padding(
            padding: EdgeInsets.only(
              top: 4,
              bottom: bottomPadding > 0 ? bottomPadding : 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                _items.length,
                (i) => _NavTabButton(
                  item: _items[i],
                  isSelected: currentIndex == i,
                  onTap: () => onTap(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSpecial;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.isSpecial = false,
  });
}

class _NavTabButton extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavTabButton({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Tab Expo especial con pill animado
    if (item.isSpecial) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFE65100), Color(0xFFFF8F00)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFFE65100).withValues(alpha: 0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? item.activeIcon : item.icon,
                size: 18,
                color: isSelected ? Colors.white : AppTheme.textHint,
              ),
              if (isSelected) ...[
                const SizedBox(width: 4),
                const Text(
                  'Expo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    // Tabs normales
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 44,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutBack,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primary.withValues(alpha: 0.10)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isSelected ? item.activeIcon : item.icon,
                size: 22,
                color: isSelected ? AppTheme.primary : AppTheme.textHint,
              ),
            ),
            const SizedBox(height: 1),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 220),
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected ? AppTheme.primary : AppTheme.textHint,
              ),
              child: Text(item.label, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
