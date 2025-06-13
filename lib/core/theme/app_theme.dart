import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: isDark ? AppColor.primaryDark : AppColor.primaryLight,
        onPrimary: isDark ? AppColor.onSurfaceDark : AppColor.onSurfaceLight,
        secondary: isDark ? AppColor.secondaryDark : AppColor.secondaryLight,
        onSecondary: isDark ? AppColor.onSurfaceDark : AppColor.onSurfaceLight,
        error: AppColor.error100,
        onError: AppColor.black0,
        surface: isDark ? AppColor.surfaceDark : AppColor.surfaceLight,
        onSurface: isDark ? AppColor.onSurfaceDark : AppColor.onSurfaceLight,
      ),
    );
  }
}
