import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthDiModule {
  @lazySingleton
  GoogleSignIn googleSignIn() {
    return GoogleSignIn.instance
      ..initialize(serverClientId: dotenv.get('WEB_CLIENT_ID'));
  }
}
