import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/presentation/result/ui_result.dart';

class TopCareerMatchesState with EquatableMixin {
  final UiResult<UserEntity> chooseSuggestedCareerResult;

  const TopCareerMatchesState({
    this.chooseSuggestedCareerResult = const Initial(),
  });

  @override
  List<Object?> get props => [chooseSuggestedCareerResult];

  TopCareerMatchesState copyWith({
    UiResult<UserEntity>? chooseSuggestedCareerResult,
  }) {
    return TopCareerMatchesState(
      chooseSuggestedCareerResult:
          chooseSuggestedCareerResult ?? this.chooseSuggestedCareerResult,
    );
  }
}
