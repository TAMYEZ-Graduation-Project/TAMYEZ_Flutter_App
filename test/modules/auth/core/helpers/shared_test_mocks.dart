import 'package:mockito/annotations.dart';
import 'package:tamyez_app/core/bootstrap/app_initializer.dart';
import 'package:tamyez_app/modules/auth/domain/repositories/auth_repository.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>(), MockSpec<AppInitializer>()])
void main() {}
