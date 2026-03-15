import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Paleta premium AldraScan ────────────────────────────────────────────────
  static const Color primary       = Color(0xFF1352A0);   // Azul marino profundo
  static const Color primaryLight  = Color(0xFF1E88E5);
  static const Color primaryDark   = Color(0xFF0D3B73);
  static const Color accent        = Color(0xFF00B4D8);   // Teal moderno
  static const Color accentWarm    = Color(0xFFFF6B35);   // Naranja acción
  static const Color whatsapp      = Color(0xFF25D366);
  static const Color surface       = Color(0xFFFFFFFF);
  static const Color surfaceVariant= Color(0xFFF4F6FB);
  static const Color background    = Color(0xFFF0F4FA);
  static const Color cardBg        = Color(0xFFFFFFFF);
  static const Color textPrimary   = Color(0xFF0D1B2A);
  static const Color textSecondary = Color(0xFF5A6B7B);
  static const Color textHint      = Color(0xFFB0BAC4);
  static const Color divider       = Color(0xFFE8ECF0);
  static const Color badgeGreen    = Color(0xFF2E7D32);
  static const Color badgeBlue     = Color(0xFF1352A0);
  static const Color badgeOrange   = Color(0xFFE65100);
  static const Color badgePurple   = Color(0xFF6A1B9A);
  static const Color badgeTeal     = Color(0xFF00838F);
  static const Color badgeGold     = Color(0xFFB8860B);

  // ── Sombras reutilizables ───────────────────────────────────────────────────
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: const Color(0xFF1352A0).withValues(alpha: 0.07),
      blurRadius: 16,
      spreadRadius: 0,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: const Color(0xFF1352A0).withValues(alpha: 0.18),
      blurRadius: 24,
      spreadRadius: -4,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> get bottomNavShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.10),
      blurRadius: 20,
      offset: const Offset(0, -4),
    ),
  ];

  // ── Tema principal ──────────────────────────────────────────────────────────
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
      surface: surface,
      primary: primary,
      secondary: accent,
    ),
    scaffoldBackgroundColor: background,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 30, fontWeight: FontWeight.w800, color: textPrimary, height: 1.15,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w700, color: textPrimary, height: 1.2,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w700, color: textPrimary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 15, fontWeight: FontWeight.w400, color: textPrimary, height: 1.55,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w400, color: textSecondary, height: 1.5,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 11, fontWeight: FontWeight.w400, color: textSecondary,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.2,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.8,
      ),
    ),
    cardTheme: CardThemeData(
      color: cardBg,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: divider, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: surface,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      shadowColor: divider,
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w700, color: textPrimary,
      ),
      iconTheme: const IconThemeData(color: textPrimary),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: textHint,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: divider, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceVariant,
      selectedColor: primary,
      labelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      side: const BorderSide(color: divider),
    ),
  );

  static Color badgeColor(String? badge) {
    if (badge == null) return badgeBlue;
    final b = badge.toLowerCase();
    if (b.contains('estrella') || b.contains('top')) return const Color(0xFFE65100);
    if (b.contains('oferta') || b.contains('pack')) return badgeOrange;
    if (b.contains('novedad') || b.contains('nuevo')) return badgePurple;
    if (b.contains('regalo') || b.contains('kit') || b.contains('gratis')) return const Color(0xFFF57F17);
    if (b.contains('mejor precio') || b.contains('calidad') || b.contains('ahorra')) return badgeGreen;
    if (b.contains('ventas') || b.contains('best')) return const Color(0xFFF57F17);
    if (b.contains('premium') || b.contains('gama')) return badgePurple;
    if (b.contains('wireless') || b.contains('ipad') || b.contains('wifi')) return badgeTeal;
    if (b.contains('exclusiva') || b.contains('colegiado')) return badgeGold;
    if (b.contains('%') || b.contains('off')) return badgeGreen;
    if (b.contains('solicitar') || b.contains('consultar')) return const Color(0xFF1352A0);
    if (b.contains('limitad')) return badgeOrange;
    return badgeBlue;
  }
}
