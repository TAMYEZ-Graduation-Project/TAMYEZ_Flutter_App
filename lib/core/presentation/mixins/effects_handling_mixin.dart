import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType;
import 'package:flutter/cupertino.dart';

import '../bases/base_stateful_widget_state.dart';
import '../error/failure_message_mapper.dart' show FailureHandling;
import '../result/ui_effect.dart';
import '../success/success_message_mapper.dart' show SuccessHandling;

enum NavigationTypeEnum {
  pushNamed,
  pushReplacementNamed,
  pop,
  pushNamedAndRemoveUntil,
}

mixin EffectsHandlingMixin<T extends StatefulWidget>
    on BaseStatefulWidgetState<T> {
  void handleEffects(UiEffect effect) {
    switch (effect) {
      case DisplayErrorEffect():
        displaySnackBar(
          contentType: ContentType.failure,
          title: appLocalizations.error,
          durationInSeconds: 4,
          message: FailureHandling.mapFailureToMessage(
            appLocalizations,
            effect.failure,
          ),
        );
      case DisplayWarningEffect():
        displaySnackBar(
          contentType: ContentType.warning,
          title: appLocalizations.warning,
          durationInSeconds: 4,
          message: FailureHandling.mapFailureToMessage(
            appLocalizations,
            effect.failure,
          ),
        );
      case DisplaySuccessEffect():
        displaySnackBar(
          contentType: ContentType.success,
          title: SuccessHandling.mapSuccessToMessage(
            appLocalizations,
            effect.success,
          ),
        );
      case NavigateEffect():
        if (!mounted) return;
        _handleNavigation(
          effect.route,
          effect.navigationType,
          argument: effect.argument,
        );
      default:
        break;
    }
  }

  void _handleNavigation<AR extends Object?>(
    String route,
    NavigationTypeEnum navigationType, {
    AR? argument,
  }) {
    switch (navigationType) {
      case NavigationTypeEnum.pushNamed:
        Navigator.pushNamed(context, route, arguments: argument);
      case NavigationTypeEnum.pushReplacementNamed:
        Navigator.pushReplacementNamed(context, route, arguments: argument);
      case NavigationTypeEnum.pop:
        Navigator.pop(context);
      case NavigationTypeEnum.pushNamedAndRemoveUntil:
        Navigator.pushNamedAndRemoveUntil(
          context,
          route,
          (route) => false,
          arguments: argument,
        );
    }
  }
}
