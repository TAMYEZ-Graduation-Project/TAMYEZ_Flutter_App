import 'package:injectable/injectable.dart';

import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show NavigationTypeEnum;
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../domain/use_cases/choose_suggested_career_use_case.dart';
import 'top_career_matches_intent.dart';
import 'top_career_matches_state.dart';

@injectable
class TopCareerMatchesViewModel
    extends BaseCubit<TopCareerMatchesState, UiEffect> {
  final ChooseSuggestedCareerUseCase _chooseSuggestedCareerUseCase;
  final UserProvider _userProvider;

  TopCareerMatchesViewModel(
    this._chooseSuggestedCareerUseCase,
    this._userProvider,
  ) : super(const TopCareerMatchesState());

  Future<void> doIntent(TopCareerMatchesIntent intent) async {
    switch (intent) {
      case ChooseSuggestedCareerIntent():
        _chooseSuggestedCareer(intent.suggestedCareerId);
    }
  }

  Future<void> _chooseSuggestedCareer(String suggestedCareerId) async {
    emit(state.copyWith(chooseSuggestedCareerResult: const Loading()));
    final result = await _chooseSuggestedCareerUseCase(
      suggestedCareerId: suggestedCareerId,
    );

    switch (result) {
      case OperationSuccess<UserEntity>():
        _userProvider.setUser(user: result.data);
        emitEffect(
          const NavigateEffect(
            route: DefinedRoutes.homeRoute,
            navigationType: NavigationTypeEnum.pushNamedAndRemoveUntil,
          ),
        );
      case OperationFailure<UserEntity>():
        emit(
          state.copyWith(chooseSuggestedCareerResult: Error(result.failure)),
        );
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }
}
