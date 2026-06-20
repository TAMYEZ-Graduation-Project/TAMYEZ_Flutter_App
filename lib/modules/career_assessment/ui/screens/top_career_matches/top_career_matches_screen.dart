import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_keys.dart' show AppKeys;
import '../../../../../core/di/di.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../domain/entities/career_details_screen_params.dart';
import '../../../domain/entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;
import 'view_model/top_career_matches_intent.dart';
import 'view_model/top_career_matches_state.dart';
import 'view_model/top_career_matches_view_model.dart';
import 'widgets/suggested_career_card.dart';

class TopCareerMatchesScreen extends StatefulWidget {
  final List<SuggestedCareerEntity> suggestedCareers;

  const TopCareerMatchesScreen({super.key, required this.suggestedCareers});

  @override
  State<TopCareerMatchesScreen> createState() => _TopCareerMatchesScreenState();
}

class _TopCareerMatchesScreenState
    extends BaseStatefulWidgetState<TopCareerMatchesScreen>
    with EffectsHandlingMixin {
  final TopCareerMatchesViewModel _viewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    _viewModel.effectStream.listen(handleEffects);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(appLocalizations.topCareers),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      appLocalizations.yourTopCareerMatches,
                      style: typography.title,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: widget.suggestedCareers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SuggestedCareerCard(
                          careerImageHeroKey: AppKeys.careerImageHeroTag(index),
                          career: widget.suggestedCareers[index],
                          onCareerViewTap: () {
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.careerDetailsRoute,
                              arguments: CareerDetailsScreenParams(
                                careerImageHeroKey: AppKeys.careerImageHeroTag(
                                  index,
                                ),
                                suggestedCareer: widget.suggestedCareers[index],
                              ),
                            );
                          },
                          onCareerSelectedTap: (careerId) {
                            _viewModel.doIntent(
                              ChooseSuggestedCareerIntent(
                                suggestedCareerId: careerId,
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 18);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          BlocSelector<
            TopCareerMatchesViewModel,
            TopCareerMatchesState,
            UiResult<void>
          >(
            selector: (state) => state.chooseSuggestedCareerResult,
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
                  child: switch (state) {
                    Loading() => const AppLoadingWidget(),
                    _ => const SizedBox.shrink(),
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
