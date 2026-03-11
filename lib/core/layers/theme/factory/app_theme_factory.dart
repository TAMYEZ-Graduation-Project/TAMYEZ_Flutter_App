import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../extensions/app_typography.dart';

abstract class AppThemeFactory {
  static ThemeData create({
    required Brightness brightness,
    required DeviceScreenType device,
    String? fontFamily,
  }) {
    final ColorScheme colorScheme = _getScheme(brightness);
    final typography = switch ((brightness, device)) {
      (Brightness.light, DeviceScreenType.mobile) => AppTypography.mobileLight(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (Brightness.light, DeviceScreenType.tablet) => AppTypography.tabletLight(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (Brightness.dark, DeviceScreenType.mobile) => AppTypography.mobileDark(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (Brightness.dark, DeviceScreenType.tablet) => AppTypography.tabletDark(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (_, _) => AppTypography.mobileLight(
        colorScheme,
        fontFamily: fontFamily,
      ), // Default
    };

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [typography],
    );
  }

  static ColorScheme _getScheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.lightBlue,
          onPrimary: AppColors.light,
          secondary: AppColors.lightGray,
          onSecondary: Colors.black,
          error: AppColors.light,
          onError: AppColors.red,
          surface: AppColors.dark,
          onSurface: AppColors.light,
        );

      case Brightness.light:
        return ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.lightBlue,
          onPrimary: AppColors.light,
          secondary: AppColors.lightGray,
          onSecondary: Colors.black,
          error: AppColors.light,
          onError: AppColors.red,
          surface: AppColors.light,
          onSurface: Colors.black,
        );
    }
  }
}
