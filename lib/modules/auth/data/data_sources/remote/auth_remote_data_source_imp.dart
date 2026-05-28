import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions/app_exceptions.dart'
    show GoogleLoginNotSupportedException, GoogleLoginException;
import '../../../../../core/utils/functions/safe_print.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final GoogleSignIn _googleSignIn;

  const AuthRemoteDataSourceImp(this._googleSignIn);

  Future<String> _googleSignInAuth() async {
    try {
      if (_googleSignIn.supportsAuthenticate()) {
        final GoogleSignInAccount googleUser = await _googleSignIn
            .authenticate();
        final String? idToken = googleUser.authentication.idToken;

        if (idToken != null) return idToken;
        throw GoogleLoginException();
      } else {
        throw GoogleLoginNotSupportedException();
      }
    } catch (e) {
      safePrint(e.toString());
      throw GoogleLoginException();
    }
  }

  @override
  Future<void> googleSocialLogin() async {
    final String token = await _googleSignInAuth();
    safePrint('google idToken: $token');
  }
}
