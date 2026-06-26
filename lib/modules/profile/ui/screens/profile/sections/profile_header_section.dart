import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_keys.dart';
import '../../../../../../core/extensions/date_parsing_extension.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../../core/presentation/widgets/network_image_caching_widget.dart';

class ProfileHeaderSection extends BaseStatelessWidget {
  final String imageUrl;
  final String title;
  final String confirmedAt;

  const ProfileHeaderSection({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.confirmedAt,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 8,
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, DefinedRoutes.editProfileRoute);
          },
          child: Center(
            child: Hero(
              tag: AppKeys.profileImageHeroTag,
              child: NetworkImageCachingWidget(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    radius: 70,
                    backgroundImage: imageProvider,
                    backgroundColor: Colors.transparent,
                  );
                },
                errorBuilder: (context, object, stackTrace) {
                  return CircleAvatar(
                    radius: 70,
                    backgroundColor: AppColors.darkGray,
                    child: const Center(child: Icon(Icons.person, size: 70)),
                  );
                },
                placeholder: (context, url) {
                  return CircleAvatar(
                    radius: 70,
                    backgroundColor: AppColors.darkGray,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
          ),
        ),
        Text(title, style: d.typography.title),
        Text(
          d.appLocalizations.joined(confirmedAt.toYMD().split('-')[0]),
          style: d.typography.subTitle.copyWith(color: AppColors.blue),
        ),
      ],
    );
  }
}
