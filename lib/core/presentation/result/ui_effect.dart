import '../../error/failures/app_failures.dart';
import '../../success/success_enum.dart';

sealed class UiEffect {
  const UiEffect();
}

class DisplayErrorEffect extends UiEffect {
  final Failure failure;

  const DisplayErrorEffect({required this.failure});
}

class SuccessEffect extends UiEffect {
  final SuccessEnum? success;

  const SuccessEffect({this.success});
}

class NavigateEffect extends UiEffect {
  final String route;

  const NavigateEffect({required this.route});
}
