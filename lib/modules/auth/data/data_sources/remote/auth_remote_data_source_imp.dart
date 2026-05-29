import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions/app_exceptions.dart'
    show GoogleLoginNotSupportedException, GoogleLoginException;
import '../../../../../core/utils/functions/has_google_services.dart';
import '../../../../../core/utils/functions/safe_print.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final GoogleSignIn _googleSignIn;

  const AuthRemoteDataSourceImp(this._googleSignIn);

  Future<String> _googleSignInAuth() async {
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
      safePrint(e.toString());
      throw GoogleLoginException(message: e.toString());
    }
  }

  @override
  Future<void> googleSocialLogin() async {
    final String token = await _googleSignInAuth();
    safePrint('google idToken: $token');
  }
}
