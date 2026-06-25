import 'package:flutter/material.dart';

import '../../../layers/localization/l10n/generated/app_localizations.dart';
import '../../../layers/theme/extensions/app_typography.dart';

abstract class AppDialogs {
  static Future<void> defaultDialog(
    BuildContext context, {
    bool dismissible = true,
    String? title,
    String? content,
    TextStyle? contentStyle,
    TextAlign? contentTextAlign,
    String? firstButtonText,
    String? secondButtonText,
    void Function()? firstButtonAction,
    void Function()? secondButtonAction,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: content != null
              ? Text(content, textAlign: contentTextAlign, style: contentStyle)
              : null,
          actions: [
            if (firstButtonText != null)
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  firstButtonAction?.call();
                },
                child: Text(firstButtonText),
              ),
            if (secondButtonText != null)
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  secondButtonAction?.call();
                },
                child: Text(secondButtonText),
              ),
          ],
        );
      },
    );
  }

  static Future<void> areYouSureDialog(
    BuildContext context, {
    bool dismissible = true,
    required String content,
    void Function()? yesButtonAction,
    void Function()? noButtonAction,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog(
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).extension<AppTypography>()!.title,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    noButtonAction?.call();
                  },
                  child: Text(AppLocalizations.of(context)!.no),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    yesButtonAction?.call();
                  },
                  child: Text(AppLocalizations.of(context)!.yes),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
