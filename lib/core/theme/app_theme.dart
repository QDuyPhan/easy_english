import 'package:easy_english/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(bool isDark) {
    final colorScheme = isDark ? _darkColorScheme : _lightColorScheme;

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme),
    ).copyWith(
      // useMaterial3: true,
      // appBarTheme: AppBarTheme(
      //   backgroundColor: colorScheme.surface,
      //   foregroundColor: colorScheme.onSurface,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: colorScheme.onSurface),
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      //   ),
      // ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        shadowColor: colorScheme.shadow.withOpacity(0.2),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
    );
  }

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.lightPrimary,
    onPrimary: AppColor.lightOnPrimary,
    primaryContainer: AppColor.lightPrimaryContainer,
    onPrimaryContainer: AppColor.lightOnPrimaryContainer,
    secondary: AppColor.lightSecondary,
    onSecondary: AppColor.lightOnSecondary,
    background: AppColor.lightBackground,
    onBackground: AppColor.lightOnBackground,
    surface: AppColor.lightSurface,
    onSurface: AppColor.lightOnSurface,
    error: AppColor.error,
    onError: AppColor.onError,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColor.darkPrimary,
    onPrimary: AppColor.darkOnPrimary,
    primaryContainer: AppColor.darkPrimaryContainer,
    onPrimaryContainer: AppColor.darkOnPrimaryContainer,
    secondary: AppColor.darkSecondary,
    onSecondary: AppColor.darkOnSecondary,
    background: AppColor.darkBackground,
    onBackground: AppColor.darkOnBackground,
    surface: AppColor.darkSurface,
    onSurface: AppColor.darkOnSurface,
    error: AppColor.error,
    onError: AppColor.onError,
  );

  static TextTheme _textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: colorScheme.onBackground,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: colorScheme.onSurface,
        height: 1.5,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: colorScheme.onSurface),
      labelSmall: TextStyle(
        fontSize: 12,
        color: colorScheme.onSurface.withOpacity(0.6),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
