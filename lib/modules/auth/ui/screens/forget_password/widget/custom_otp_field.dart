import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

import '../../../../../../core/layers/theme/colors/app_colors.dart';

class CustomOtpField extends StatelessWidget {
  final String? forceErrorText;
  final void Function(String value)? onChange;

  const CustomOtpField({super.key, this.onChange, this.forceErrorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: TextFormField(
        textAlignVertical: const TextAlignVertical(y: -1),
        cursorErrorColor: AppColors.red,
        forceErrorText: forceErrorText,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0, height: -1),
          counterText: '',
          enabledBorder: const OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
          focusedBorder: const OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(color: AppColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(color: AppColors.red),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
