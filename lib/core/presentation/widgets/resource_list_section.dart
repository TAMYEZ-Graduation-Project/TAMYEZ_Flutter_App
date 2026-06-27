import 'package:flutter/material.dart';

import '../../entities/resource_entity.dart';
import '../../layers/theme/colors/app_colors.dart';
import '../bases/base_stateless_widget.dart';
import 'resource_list_item.dart';

class ResourceListSection extends BaseStatelessWidget {
  final String title;
  final List<ResourceItemEntity> resources;
  final String iconPath;

  const ResourceListSection({
    super.key,
    required this.title,
    required this.resources,
    required this.iconPath,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: d.typography.title),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: d.themeManager.isDarkTheme
                ? AppColors.dark
                : AppColors.lightBlue,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: resources.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ResourceListItem(
                  resourceItem: resources[index],
                  iconPath: iconPath,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
