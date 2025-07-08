import 'package:easy_english/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData getTheme(bool isDark) {
    final colorScheme = isDark ? _darkColorScheme : _lightColorScheme;

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme),
    ).copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      cardTheme: CardTheme(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
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
    return ThemeData.light().textTheme.copyWith(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: colorScheme.onBackground,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: colorScheme.onSurface),
      bodyMedium: TextStyle(fontSize: 14, color: colorScheme.onSurface),
      labelSmall: TextStyle(
        fontSize: 12,
        color: colorScheme.onSurface.withOpacity(0.6),
      ),
    );
  }
}
