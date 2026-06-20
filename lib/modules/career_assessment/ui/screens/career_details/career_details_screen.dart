import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/widgets/network_image_caching_widget.dart';
import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/entities/career_entity.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../domain/entities/career_details_screen_params.dart';
import '../../../domain/entities/check_career_assessment_answers_response_entity.dart';
import 'sections/career_detail_section_header.dart';
import 'sections/resource_list_item.dart';
import 'sections/roadmap_step_item.dart';
import 'view_model/career_details_intent.dart';
import 'view_model/career_details_screen_view_model.dart';
import 'view_model/career_details_state.dart' show CareerDetailsState;

class CareerDetailsScreen extends StatefulWidget {
  final CareerDetailsScreenParams params;

  const CareerDetailsScreen({super.key, required this.params});

  @override
  State<CareerDetailsScreen> createState() => _CareerDetailsScreenState();
}

class _CareerDetailsScreenState
    extends BaseStatefulWidgetState<CareerDetailsScreen> {
  final CareerDetailsViewModel _viewModel = getIt.get();
  late final SuggestedCareerEntity suggestedCareer;

  @override
  void initState() {
    suggestedCareer = widget.params.suggestedCareer;
    super.initState();
    _viewModel.doIntent(
      GetCareerDetailsIntent(careerId: suggestedCareer.careerId.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            suggestedCareer.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              if (suggestedCareer.careerId.pictureUrl.isNotEmpty)
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: Hero(
                        tag: widget.params.careerImageHeroKey,
                        child: NetworkImageCachingWidget(
                          imageUrl: suggestedCareer.careerId.pictureUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              BlocSelector<
                CareerDetailsViewModel,
                CareerDetailsState,
                UiResult<CareerEntity>
              >(
                selector: (state) => state.careerDetailsResult,
                builder: (context, result) {
                  switch (result) {
                    case Initial<CareerEntity>():
                    case Loading<CareerEntity>():
                      return const SliverFillRemaining(
                        child: AppLoadingWidget(),
                      );
                    case Success<CareerEntity>():
                      final career = result.data;
                      return SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CareerDetailSectionHeader(
                              title: appLocalizations.careerOverview,
                            ),
                            Text(career.description, style: typography.body),
                            const SizedBox(height: 24),

                            if (career.roadmap.isNotEmpty) ...[
                              CareerDetailSectionHeader(
                                title: appLocalizations.roadmapPreview,
                              ),
                              ...career.roadmap
                                  .take(3)
                                  .map(
                                    (step) => RoadmapStepItem(
                                      title: step.title,
                                      description: step.description,
                                      order: step.order,
                                    ),
                                  ),
                              const SizedBox(height: 24),
                            ],

                            // 4. Courses Section
                            if (career.courses.isNotEmpty) ...[
                              CareerDetailSectionHeader(
                                title: appLocalizations.courses,
                              ),
                              ...career.courses.map(
                                (course) => ResourceListItem(
                                  resourceItem: course,
                                  iconPath: AssetPaths.defaultCourseIcon,
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],

                            // 5. Books Section
                            if (career.books.isNotEmpty) ...[
                              CareerDetailSectionHeader(
                                title: appLocalizations.books,
                              ),
                              ...career.books.map(
                                (book) => ResourceListItem(
                                  iconPath: AssetPaths.defaultBookIcon,
                                  resourceItem: book,
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],

                            // 6. YouTube Explanations Section
                            if (career.youtubePlaylists.isNotEmpty) ...[
                              CareerDetailSectionHeader(
                                title: appLocalizations.youtubeExplanations,
                              ),
                              ...career.youtubePlaylists.map(
                                (playlist) => ResourceListItem(
                                  iconPath:
                                      AssetPaths.defaultYoutubePlaylistIcon,
                                  resourceItem: playlist,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    case Error<CareerEntity>():
                      return SliverFillRemaining(
                        child: AppErrorWidget(
                          failure: result.failure,
                          onRetry: () {
                            _viewModel.doIntent(
                              GetCareerDetailsIntent(
                                careerId: suggestedCareer.careerId.id,
                              ),
                            );
                          },
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
