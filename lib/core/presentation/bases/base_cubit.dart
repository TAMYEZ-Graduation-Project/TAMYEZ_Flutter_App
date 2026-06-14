import 'dart:async' show StreamController;

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State, Effect> extends Cubit<State> {
  BaseCubit(super.initialState);

  final _effectController = StreamController<Effect>();

  Stream<Effect> get effectStream => _effectController.stream;

  void emitEffect(Effect effect) {
    if (_effectController.isClosed) {
      throw StateError('Cannot emit new effects after calling close');
    }
    _effectController.add(effect);
  }

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
