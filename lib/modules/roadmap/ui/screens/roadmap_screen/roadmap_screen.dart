import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/entities/career_entity.dart';
import '../../../../../core/entities/roadmap_step_entity.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import 'view_model/roadmap_intent.dart';
import 'view_model/roadmap_state.dart';
import 'view_model/roadmap_view_model.dart';
import 'widgets/end_roadmap_step.dart';
import 'widgets/inner_roadmap_step.dart';
import 'widgets/roadmap_header_widget.dart';
import 'widgets/roadmap_progress_bar.dart';
import 'widgets/start_roadmap_step.dart';

class RoadmapPage extends StatefulWidget {
  const RoadmapPage({super.key});

  @override
  State<RoadmapPage> createState() => _RoadmapPageState();
}

class _RoadmapPageState extends BaseStatefulWidgetState<RoadmapPage>
    with EffectsHandlingMixin {
  final RoadmapViewModel _viewModel = getIt.get();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel.doIntent(const GetUserCareerIntent());
    _viewModel.effectStream.listen(handleEffects);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _viewModel.doIntent(const GetRoadmapStepsIntent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text('Career Roadmap'), centerTitle: true),
        body: BlocBuilder<RoadmapViewModel, RoadmapState>(
          buildWhen: (previous, current) {
            return previous.careerDetails != current.careerDetails;
          },
          builder: (context, state) {
            final result = state.careerDetails;
            switch (result) {
              case Initial<CareerEntity>():
              case Loading<CareerEntity>():
                return Skeletonizer(
                  child: _RoadmapScreenLayout(
                    isLastPage: true,
                    career: fakeCareer,
                  ),
                );
              case Success<CareerEntity>():
                return _RoadmapScreenLayout(
                  career: result.data,
                  scrollController: _scrollController,
                  isLastPage: state.isLastPage,
                );
              case Error<CareerEntity>():
                return AppErrorWidget(
                  failure: result.failure,
                  onRetry: () =>
                      _viewModel.doIntent(const GetUserCareerIntent()),
                );
            }
          },
        ),
      ),
    );
  }

  final CareerEntity fakeCareer = const CareerEntity(
    id: '1',
    title: 'Software Engineer',
    pictureUrl: 'https://picsum.photos/200/300',
    roadmap: [
      RoadmapStepEntity(
        id: '1',
        title: 'Introduction to Programming',
        progressStatus: RoadmapStepProgressStatusEnum.completed,
      ),
      RoadmapStepEntity(
        id: '2',
        title: 'Data Structures and Algorithms',
        progressStatus: RoadmapStepProgressStatusEnum.inProgress,
      ),
      RoadmapStepEntity(
        id: '3',
        title: 'Web Development',
        progressStatus: RoadmapStepProgressStatusEnum.available,
      ),
      RoadmapStepEntity(id: '4', title: 'Database Management'),
    ],
  );
}

class _RoadmapScreenLayout extends BaseStatelessWidget {
  final CareerEntity career;
  final ScrollController? scrollController;
  final bool isLastPage;

  const _RoadmapScreenLayout({
    required this.career,
    this.scrollController,
    this.isLastPage = false,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final roadmapSteps = career.roadmap;
    final int totalSteps = roadmapSteps.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      child: Column(
        spacing: 18,
        children: [
          RoadmapHeaderWidget(imageUrl: career.pictureUrl, title: career.title),
          RoadmapProgressBar(progress: career.percentageCompleted.toDouble()),
          const SizedBox(height: 18),
          BlocSelector<RoadmapViewModel, RoadmapState, bool>(
            selector: (state) => state.gettingMoreSteps,
            builder: (context, gettingMoreSteps) {
              return Flexible(
                child: SizedBox(
                  width: d.screenSize.width * 0.75,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: gettingMoreSteps ? totalSteps + 1 : totalSteps,
                    itemBuilder: (context, index) {
                      if (index == totalSteps) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (index == 0) {
                        return StartRoadmapStep(
                          roadmapStepEntity: roadmapSteps[index],
                          textDirection: d.localizationManager.isEnglish
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                        );
                      }

                      if (index % 2 != 0) {
                        if (isLastPage && index == totalSteps - 1) {
                          return EndRoadmapStep(
                            roadmapStepEntity: roadmapSteps[index],
                            textDirection: d.localizationManager.isEnglish
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                          );
                        }
                        return InnerRoadmapStep(
                          roadmapStepEntity: roadmapSteps[index],
                          textDirection: d.localizationManager.isEnglish
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                        );
                      } else {
                        if (isLastPage && index == totalSteps - 1) {
                          return EndRoadmapStep(
                            roadmapStepEntity: roadmapSteps[index],
                            textDirection: d.localizationManager.isEnglish
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                          );
                        }
                        return InnerRoadmapStep(
                          roadmapStepEntity: roadmapSteps[index],
                          textDirection: d.localizationManager.isEnglish
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
