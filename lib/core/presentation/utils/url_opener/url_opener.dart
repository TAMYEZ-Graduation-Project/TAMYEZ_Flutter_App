abstract interface class UrlOpener {
  Future<bool> open(String url, {bool launchInExternalApp = true});
}
