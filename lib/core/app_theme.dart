// lib/core/app_theme.dart
import 'package:flutter/material.dart';

// ── Design Tokens (nama sama dengan di Figma) ─────────────
class AppColors {
  static const primary = Color(0xFF00796B); // color.primary
  static const warning = Color(0xFFF5A623); // color.warning
  static const danger = Color(0xFFC62828); // color.danger
}

class AppSpace {
  static const sm = 8.0; // space.sm
  static const md = 16.0; // space.md
  static const lg = 24.0; // space.lg
}

// ── Theme ─────────────────────────────────────────────────
class AppTheme {
  static ThemeData get light => ThemeData(
        colorSchemeSeed: AppColors.primary,
        useMaterial3: true,
      );
}

// Lengkapi token saat desain Figma selesai di M03.
