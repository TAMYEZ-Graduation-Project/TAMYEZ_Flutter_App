import 'package:flutter/material.dart';

import '../../../../../../core/extensions/date_parsing_extension.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../domain/entities/saved_quizzes_entity.dart';

class SavedQuizItem extends BaseStatelessWidget {
  final SavedQuizEntity savedQuiz;

  const SavedQuizItem({super.key, required this.savedQuiz});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(savedQuiz.quizId.title, style: d.typography.subTitle),
            Text(
              'Completed on: ${savedQuiz.takenAt.toYMD()}',
              style: d.typography.body.copyWith(color: AppColors.blue),
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              DefinedRoutes.savedQuizRoute,
              arguments: savedQuiz.id,
            );
          },
          child: const Text('Review'),
        ),
      ],
    );
  }
}
