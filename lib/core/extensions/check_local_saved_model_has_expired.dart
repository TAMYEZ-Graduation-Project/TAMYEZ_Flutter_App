extension CheckLocalSavedModelHasExpired on int {
  bool isExpired() {
    final now = DateTime.now().millisecondsSinceEpoch;
    const halfHourInMs = 30 * 60 * 1000; // 30 minutes
    return now - this >= halfHourInMs;
  }
}
