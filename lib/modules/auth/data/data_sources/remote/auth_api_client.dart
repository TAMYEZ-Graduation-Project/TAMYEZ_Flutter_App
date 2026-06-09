import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/dio/dio_constants.dart' show DioNames;
import '../../models/gmail_login_request.dart';
import '../../models/login_request.dart' show LoginRequest;
import '../../models/login_response.dart';
import '../../models/sign_up_request.dart';
import '../../models/sign_up_response.dart';
import 'auth_endpoints.dart';

part 'auth_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiClient {
  @FactoryMethod()
  factory AuthApiClient(@Named(DioNames.mainDio) Dio dio) = _AuthApiClient;

  @POST(AuthEndpoints.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequest request);

  @POST(AuthEndpoints.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(AuthEndpoints.gmailSignUp)
  Future<LoginResponse> gmailSignUp(@Body() GmailLoginRequest request);

  @POST(AuthEndpoints.gmailLogin)
  Future<LoginResponse> gmailLogin(@Body() GmailLoginRequest request);
}
