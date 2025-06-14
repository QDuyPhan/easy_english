import 'package:easy_english/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(bool isDark) {
    final colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: isDark ? AppColor.primaryDark : AppColor.primaryLight,
      onPrimary: isDark ? AppColor.onSurfaceDark : AppColor.onSurfaceLight,
      secondary: isDark ? AppColor.secondaryDark : AppColor.secondaryLight,
      onSecondary: isDark ? AppColor.onSurfaceDark : AppColor.onSurfaceLight,
      error: AppColor.error100,
      onError: AppColor.black0,
      surface: isDark ? AppColor.surfaceDark : AppColor.surfaceLight,
      onSurface: isDark ? AppColor.onSurfaceDark : AppColor.onSurfaceLight,
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: ThemeData.light().textTheme.apply(fontFamily: ''),
    ).copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: '',
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      cardTheme: CardTheme(
        color: colorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: '',
        ),
      ),
    );
  }
}
