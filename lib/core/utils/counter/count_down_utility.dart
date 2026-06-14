import 'dart:async' show Timer;

import 'package:injectable/injectable.dart';

@injectable
class CountDownUtility {
  Timer? _timer;

  bool get isCountdownRunning => _timer?.isActive ?? false;

  void startCountdown({
    required int seconds,
    required void Function(int remaining) onTick,
    required void Function() onFinished,
  }) {
    _timer?.cancel();

    int remaining = seconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remaining--;

      if (remaining <= 0) {
        timer.cancel();
        onFinished();
      } else {
        onTick(remaining);
      }
    });
  }

  void cancelCountdown() {
    _timer?.cancel();
  }
}
