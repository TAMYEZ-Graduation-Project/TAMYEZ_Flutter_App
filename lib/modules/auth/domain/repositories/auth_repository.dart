import '../../../../core/execution/operation_result.dart';
import '../entities/login_params.dart';
import '../entities/login_response_entity.dart';
import '../entities/sign_up_params.dart';
import '../entities/sign_up_response_entity.dart';

abstract interface class AuthRepository {
  Future<OperationResult<SignUpResponseEntity>> signUp({
    required SignUpParams params,
  });

  Future<OperationResult<LoginResponseEntity>> gmailSignUp();

  Future<OperationResult<LoginResponseEntity>> login({
    required LoginParams params,
    required bool rememberMe
  });

  Future<OperationResult<LoginResponseEntity>> gmailLogin();


  Future<bool> isThereLoginSession();
}
