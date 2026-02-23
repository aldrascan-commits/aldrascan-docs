import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Paleta minimalista clínica ──────────────────────────────────────────────
  static const Color primary = Color(0xFF1565C0);     // Azul médico
  static const Color primaryLight = Color(0xFF1E88E5);
  static const Color accent = Color(0xFF00ACC1);      // Teal sutil
  static const Color whatsapp = Color(0xFF25D366);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color badgeGreen = Color(0xFF2E7D32);
  static const Color badgeBlue = Color(0xFF1565C0);
  static const Color badgeOrange = Color(0xFFE65100);
  static const Color badgePurple = Color(0xFF6A1B9A);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
          surface: surface,
        ),
        scaffoldBackgroundColor: background,
        textTheme: GoogleFonts.interTextTheme().copyWith(
          displayLarge: GoogleFonts.inter(
            fontSize: 28, fontWeight: FontWeight.w700, color: textPrimary,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w600, color: textPrimary,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 15, fontWeight: FontWeight.w400, color: textPrimary,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 13, fontWeight: FontWeight.w400, color: textSecondary,
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5,
          ),
        ),
        cardTheme: CardThemeData(
          color: cardBg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: divider, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: surface,
          elevation: 0,
          scrolledUnderElevation: 1,
          shadowColor: divider,
          centerTitle: false,
          titleTextStyle: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),
          iconTheme: const IconThemeData(color: textPrimary),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: surface,
          selectedItemColor: primary,
          unselectedItemColor: textHint,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primary, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            textStyle: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  static Color badgeColor(String? badge) {
    if (badge == null) return badgeBlue;
    final b = badge.toLowerCase();
    if (b.contains('estrella')) return const Color(0xFFF57F17);
    if (b.contains('oferta')) return badgeOrange;
    if (b.contains('novedad')) return badgePurple;
    if (b.contains('regalo') || b.contains('kit')) return const Color(0xFFF57F17);
    if (b.contains('mejor precio') || b.contains('calidad')) return badgeGreen;
    if (b.contains('top ventas') || b.contains('best seller')) return const Color(0xFFF57F17);
    if (b.contains('premium')) return badgePurple;
    if (b.contains('pack') || b.contains('all-in-one')) return badgeOrange;
    if (b.contains('wireless') || b.contains('ipad')) return const Color(0xFF00838F);
    if (b.contains('exclusiva')) return badgePurple;
    if (b.contains('ahorra') || b.contains('%')) return badgeGreen;
    return badgeBlue;
  }
}
