import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@module
abstract class DeviceIdDiModule {
  @lazySingleton
  Uuid provideUuid() {
    return const Uuid();
  }
}
