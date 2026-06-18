import 'package:equatable/equatable.dart';

import '../../../../../../core/presentation/result/ui_result.dart';

class TopCareerMatchesState with EquatableMixin {
  final UiResult<void> chooseSuggestedCareerResult;

  const TopCareerMatchesState({
    this.chooseSuggestedCareerResult = const Initial(),
  });

  @override
  List<Object?> get props => [chooseSuggestedCareerResult];

  TopCareerMatchesState copyWith({
    UiResult<void>? chooseSuggestedCareerResult,
  }) {
    return TopCareerMatchesState(
      chooseSuggestedCareerResult:
          chooseSuggestedCareerResult ?? this.chooseSuggestedCareerResult,
    );
  }
}
