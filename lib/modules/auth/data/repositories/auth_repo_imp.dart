import 'package:injectable/injectable.dart';

import '../../../../core/error/mappers/exceptions_mapper.dart';
import '../../../../core/execution/operation_result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepoImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepoImp(this._authRemoteDataSource);

  @override
  Future<OperationResult<void>> googleSocialLogin() async {
    try {
      await _authRemoteDataSource.googleSocialLogin();
      return OperationSuccess<void>(null);
    } catch (e) {
      return OperationFailure<void>(
        ExceptionHandling.mapExceptionsToFailures(e),
      );
    }
  }
}
