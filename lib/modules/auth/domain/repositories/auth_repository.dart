import '../../../../core/execution/operation_result.dart';
import '../entities/login_params.dart';
import '../entities/login_response_entity.dart';
import '../entities/reset_password_params.dart' show ResetPasswordParams;
import '../entities/sign_up_params.dart';
import '../entities/sign_up_response_entity.dart';
import '../entities/user_email_params.dart';
import '../entities/verify_code_params.dart';

abstract interface class AuthRepository {
  Future<OperationResult<SignUpResponseEntity>> signUp({
    required SignUpParams params,
  });

  Future<OperationResult<LoginResponseEntity>> gmailSignUp();

  Future<OperationResult<bool>> resendEmailVerification({
    required UserEmailParams params,
  });

  Future<OperationResult<LoginResponseEntity>> login({
    required LoginParams params,
    required bool rememberMe,
  });

  Future<OperationResult<LoginResponseEntity>> gmailLogin({
    required bool rememberMe,
  });

  Future<bool> isThereLoginSession();

  Future<OperationResult<bool>> forgetPassword({
    required UserEmailParams params,
  });

  Future<OperationResult<bool>> verifyCode({required VerifyCodeParams params});

  Future<OperationResult<bool>> resetPassword({
    required ResetPasswordParams params,
  });
}
