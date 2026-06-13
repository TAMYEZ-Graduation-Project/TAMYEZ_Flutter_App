import '../../error/failures/app_failures.dart';
import '../../success/success_enum.dart';
import '../mixins/effects_handling_mixin.dart';

sealed class UiEffect {
  const UiEffect();
}

class DisplayErrorEffect extends UiEffect {
  final Failure failure;

  const DisplayErrorEffect({required this.failure});
}

class SuccessEffect extends UiEffect {
  final SuccessEnum success;

  const SuccessEffect({required this.success});
}

class NavigateEffect extends UiEffect {
  final String route;
  final NavigationTypeEnum navigationType;
  final Object? argument;

  const NavigateEffect({
    required this.route,
    this.navigationType = NavigationTypeEnum.pushNamed,
    this.argument,
  });
}

class PageNavigationEffect extends UiEffect {
  final int page;

  const PageNavigationEffect({required this.page});
}
