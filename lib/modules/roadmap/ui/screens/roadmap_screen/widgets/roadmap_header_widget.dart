import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/network_image_caching_widget.dart';

class RoadmapHeaderWidget extends BaseStatelessWidget {
  final String imageUrl;
  final String title;

  const RoadmapHeaderWidget({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Row(
      children: [
        NetworkImageCachingWidget(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              radius: 35,
              backgroundImage: imageProvider,
              backgroundColor: Colors.transparent,
            );
          },
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: d.typography.subTitle),
            Text(
              d.appLocalizations.yourPathToSuccess,
              style: d.typography.subTitle.copyWith(color: AppColors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
