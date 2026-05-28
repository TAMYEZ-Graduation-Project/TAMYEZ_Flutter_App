import '../../../../core/execution/operation_result.dart';

abstract interface class AuthRepository {
  Future<OperationResult<void>> googleSocialLogin();
}
