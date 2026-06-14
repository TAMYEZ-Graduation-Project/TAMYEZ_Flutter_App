import 'dart:io' show Platform;

import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignIn, GoogleSignInAccount;
import 'package:injectable/injectable.dart' show Injectable;

import '../../../../../core/error/exceptions/app_exceptions.dart';
import '../../../../../core/utils/functions/has_google_services.dart'
    show hasGoogleServices;
import 'social_auth_service.dart';

@Injectable(as: SocialAuthService)
class SocialAuthServiceImp implements SocialAuthService {
  final GoogleSignIn _googleSignIn;

  const SocialAuthServiceImp(this._googleSignIn);

  @override
  Future<String> getGoogleIdToken() async {
    if (!_googleSignIn.supportsAuthenticate() ||
        (Platform.isAndroid && !(await hasGoogleServices()))) {
      throw const GoogleLoginNotSupportedException();
    }
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final String? idToken = googleUser.authentication.idToken;

      if (idToken != null) return idToken;
      throw const GoogleLoginException();
    } catch (e) {
      throw GoogleLoginException(message: e.toString());
    }
  }
}
