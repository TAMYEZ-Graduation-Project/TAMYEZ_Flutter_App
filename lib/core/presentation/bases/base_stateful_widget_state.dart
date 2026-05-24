import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show AwesomeSnackbarContent, ContentType;
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import '../../layers/theme/extensions/app_typography.dart' show AppTypography;
import '../routing/navigator_key.dart' show globalNavigatorKey;

typedef VoidFunction = void Function()?;

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> {
  late ThemeData theme;
  late AppTypography typography;
  late Size screenSize;
  late LocalizationManager localizationManager;

  // This will always point to the correct context
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    typography = theme.extension<AppTypography>() ?? AppTypography.mobileBase;
    screenSize = MediaQuery.sizeOf(context);
    localizationManager = getIt.get<LocalizationManager>();
  }

  // Current fresh context with runtime check
  BuildContext get safeContext {
    try {
      // This will throw if context is inaccessible
      final ctx = context;
      // Verify we can use it
      if (ctx.mounted) {
        // Additional safety check
        return ctx;
      }
    } catch (_) {}

    // Fallback: Find the nearest context from the root
    return globalNavigatorKey
        .currentContext!; //getIt.get<GlobalKey<NavigatorState>>().currentContext!;
  }

  Future<void> displaySnackBar({
    required ContentType contentType,
    required String title,
    String? message,
    int? durationInSeconds,
  }) async {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: Duration(seconds: durationInSeconds ?? 2),
      content: AwesomeSnackbarContent(
        title: title,
        titleTextStyle: theme.textTheme.titleMedium!.copyWith(
          color: Colors.white,
        ),
        message: message ?? '',
        messageTextStyle: theme.textTheme.labelMedium!.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(safeContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
