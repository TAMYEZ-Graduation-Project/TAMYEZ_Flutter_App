import 'dart:async' show FutureOr;

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
FutureOr<void> configureDependencies() async => getIt.init();
