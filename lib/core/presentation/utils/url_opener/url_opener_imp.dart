import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'url_opener.dart';

@LazySingleton(as: UrlOpener)
class UrlOpenerImp implements UrlOpener {
  @override
  Future<bool> open(String url, {bool launchInExternalApp = true}) {
    return launchUrl(
      Uri.parse(url),
      mode: launchInExternalApp
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault,
    );
  }
}
