import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../core/presentation/widgets/resource_list_section.dart';
import '../../../../quiz/domain/entities/exam_preparation_screen_params.dart';
import 'sections/roadmap_step_details_description_section.dart';
import 'view_model/roadmap_step_details_intent.dart';
import 'view_model/roadmap_step_details_state.dart';
import 'view_model/roadmap_step_details_view_model.dart';

class RoadmapStepDetailsScreen extends StatefulWidget {
  final RoadmapStepEntity roadmapStep;

  const RoadmapStepDetailsScreen({super.key, required this.roadmapStep});

  @override
  State<RoadmapStepDetailsScreen> createState() =>
      _RoadmapStepDetailsScreenState();
}

class _RoadmapStepDetailsScreenState extends State<RoadmapStepDetailsScreen> {
  final RoadmapStepDetailsViewModel _viewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    _viewModel.doIntent(
      GetRoadmapStepDetailsIntent(roadmapStepId: widget.roadmapStep.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.roadmapStep.title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child:
                BlocSelector<
                  RoadmapStepDetailsViewModel,
                  RoadmapStepDetailsState,
                  UiResult<RoadmapStepEntity>
                >(
                  selector: (state) => state.roadmapStepDetailsResult,
                  builder: (context, result) {
                    switch (result) {
                      case Initial<RoadmapStepEntity>():
                      case Loading<RoadmapStepEntity>():
                        return const AppLoadingWidget();
                      case Success<RoadmapStepEntity>():
                        final roadmapStep = result.data;
                        return _RoadmapStepDetailLayout(
                          roadmapStep: roadmapStep,
                        );
                      case Error<RoadmapStepEntity>():
                        return AppErrorWidget(
                          failure: result.failure,
                          onRetry: () {
                            _viewModel.doIntent(
                              GetRoadmapStepDetailsIntent(
                                roadmapStepId: widget.roadmapStep.id,
                              ),
                            );
                          },
                        );
                    }
                  },
                ),
          ),
        ),
      ),
    );
  }
}

class _RoadmapStepDetailLayout extends BaseStatelessWidget {
  final RoadmapStepEntity roadmapStep;

  const _RoadmapStepDetailLayout({required this.roadmapStep});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView(
        children: [
          RoadmapStepDetailsDescriptionSection(
            title: d.appLocalizations.roadmapPreview,
            description: roadmapStep.description,
          ),
          if (roadmapStep.courses.isNotEmpty) ...[
            const SizedBox(height: 17),
            ResourceListSection(
              title: d.appLocalizations.courses,
              resources: roadmapStep.courses,
              iconPath: AssetPaths.defaultCourseIcon,
            ),
          ],
          if (roadmapStep.books.isNotEmpty) ...[
            const SizedBox(height: 17),
            ResourceListSection(
              title: d.appLocalizations.books,
              resources: roadmapStep.books,
              iconPath: AssetPaths.defaultBookIcon,
            ),
          ],
          if (roadmapStep.youtubePlaylists.isNotEmpty) ...[
            const SizedBox(height: 17),
            ResourceListSection(
              title: d.appLocalizations.youtubeExplanations,
              resources: roadmapStep.youtubePlaylists,
              iconPath: AssetPaths.defaultYoutubePlaylistIcon,
            ),
          ],
          const SizedBox(height: 17),

          RoadmapStepDetailsDescriptionSection(
            title: d.appLocalizations.postCourseQuiz,
            description: d.appLocalizations.postCourseQuizDescription,
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilledButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DefinedRoutes.examPreparationRoute,
                  arguments: ExamPreparationScreenParams(
                    quiz: roadmapStep.quizzes[0],
                    stepTitle: roadmapStep.title,
                    stepId: roadmapStep.id,
                  ),
                );
              },
              child: Text(d.appLocalizations.takeQuiz),
            ),
          ),
        ],
      ),
    );
  }
}
