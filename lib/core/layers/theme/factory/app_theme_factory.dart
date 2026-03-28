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
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: typography.button.copyWith(color: AppColors.light),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.gray,
          padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: typography.button.copyWith(color: AppColors.dark),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: brightness == Brightness.light
            ? AppColors.lightBlue
            : null,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: typography.subTitle.copyWith(color: AppColors.lightGreen),
        filled: true,
        fillColor: AppColors.gray,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.red),
        ),
        errorStyle: typography.label.copyWith(color: AppColors.red),
      ),
      checkboxTheme: _getCheckBoxTheme(brightness),
    );
  }

  static ColorScheme _getScheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.blue,
          onPrimary: AppColors.light,
          secondary: AppColors.gray,
          onSecondary: Colors.black,
          error: AppColors.light,
          onError: AppColors.red,
          surface: AppColors.dark,
          onSurface: AppColors.light,
        );

      case Brightness.light:
        return ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.blue,
          onPrimary: AppColors.light,
          secondary: AppColors.gray,
          onSecondary: Colors.black,
          error: AppColors.light,
          onError: AppColors.red,
          surface: AppColors.light,
          onSurface: Colors.black,
        );
    }
  }

  static CheckboxThemeData _getCheckBoxTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return CheckboxThemeData(
          side: BorderSide(color: AppColors.gray, width: 2),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.blue;
            }
            return AppColors.lightPink;
          }),
          checkColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.light;
            }
            return null;
          }),
        );
      case Brightness.dark:
        return CheckboxThemeData(
          side: BorderSide(color: AppColors.gray, width: 2),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.blue;
            }
            return AppColors.dark;
          }),
          checkColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.light;
            }
            return null;
          }),
        );
    }
  }
}
