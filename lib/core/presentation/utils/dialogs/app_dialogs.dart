import 'package:flutter/material.dart';

abstract class AppDialogs {
  static Future<void> defaultDialog(
    BuildContext context, {
    bool dismissible = true,
    String? title,
    String? content,
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
          content: content != null ? Text(content) : null,
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
}
