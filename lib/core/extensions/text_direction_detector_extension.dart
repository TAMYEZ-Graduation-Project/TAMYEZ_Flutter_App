import 'dart:ui' show TextDirection;

extension DirectionDetector on String {
  TextDirection get textDirection {
    for (int i = 0; i < length; i++) {
      final codeUnit = codeUnitAt(i);

      // English
      if ((codeUnit >= 0x0041 && codeUnit <= 0x005A) ||
          (codeUnit >= 0x0061 && codeUnit <= 0x007A)) {
        return TextDirection.ltr;
      }

      // Arabic
      if (codeUnit >= 0x0600 && codeUnit <= 0x06FF) {
        return TextDirection.rtl;
      }
    }
    return TextDirection.ltr;
  }
}
