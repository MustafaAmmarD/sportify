import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Background layers ──
  static const Color background = Color(0xFF0A0E14);
  static const Color surface = Color(0xFF131920);
  static const Color surfaceLight = Color(0xFF1A2332);
  static const Color card = Color(0xFF161D27);
  static const Color cardHover = Color(0xFF1E2A38);

  // ── Primary: Emerald Green (football pitch) ──
  static const Color primary = Color(0xFF00E676);
  static const Color primaryDark = Color(0xFF00C853);
  static const Color primaryLight = Color(0xFF69F0AE);
  static const Color primaryMuted = Color(0xFF1B5E20);

  // ── Accent: Gold (trophy / AI score) ──
  static const Color accent = Color(0xFFFFD54F);
  static const Color accentDark = Color(0xFFFFC107);
  static const Color accentLight = Color(0xFFFFE082);

  // ── Text hierarchy ──
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textMuted = Color(0xFF607D8B);
  static const Color textHint = Color(0xFF455A64);

  // ── Status colors ──
  static const Color available = Color(0xFF00E676);
  static const Color unavailable = Color(0xFFFF5252);
  static const Color onLoan = Color(0xFFFF9800);
  static const Color negotiating = Color(0xFF42A5F5);

  // ── Borders & Dividers ──
  static const Color border = Color(0xFF1E2A38);
  static const Color borderLight = Color(0xFF2A3A4E);
  static const Color divider = Color(0xFF1A2332);

  // ── Gradients ──
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00E676), Color(0xFF00B0FF)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A2332), Color(0xFF131920)],
  );

  static const LinearGradient scoreGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD54F), Color(0xFFFF9800)],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xFF0A0E14)],
  );

  // ── Shadows ──
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get glowShadow => [
    BoxShadow(
      color: primary.withValues(alpha: 0.3),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];
}
