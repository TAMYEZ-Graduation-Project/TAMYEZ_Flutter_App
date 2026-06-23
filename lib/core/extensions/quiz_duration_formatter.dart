extension DurationFormatter on int {
  String toHoursMinutes() {
    final duration = Duration(seconds: this);

    final minutes = duration.inMinutes.remainder(60);
    final hours = duration.inHours;

    if (hours == 0 && minutes == 0) {
      return '0 minutes';
    }

    if (hours == 0) {
      return '$minutes minute${minutes == 1 ? '' : 's'}';
    }

    if (minutes == 0) {
      return '$hours hour${hours == 1 ? '' : 's'}';
    }

    return '$hours hour${hours == 1 ? '' : 's'} '
        '$minutes minute${minutes == 1 ? '' : 's'}';
  }
}
