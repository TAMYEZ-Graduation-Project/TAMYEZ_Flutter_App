import 'dart:ui';

abstract final class AppColors {
  static const Color _light = Color(0xFFFFFFFF);
  static const Color _dark = Color(0xFF01101C);
  static const Color _darkBlue = Color(0xFF053155);
  static const Color _lightBlue = Color(0xFF0E6A97);
  static const Color _lightGray = Color(0xFFE8F0F2);
  static const Color _darkGray = Color(0xFF8D9193);
  static const Color _red = Color(0xFFFF0A0A);

  static Color get light => _light;

  static Color get dark => _dark;

  static Color get darkBlue => _darkBlue;

  static Color get lightBlue => _lightBlue;

  static Color get lightGray => _lightGray;

  static Color get darkGray => _darkGray;

  static Color get red => _red;
}
