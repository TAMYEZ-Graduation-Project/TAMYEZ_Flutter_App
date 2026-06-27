import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class ArrowedProfileItemWidget extends BaseStatelessWidget {
  final String title;
  final Color? titleColor;
  final String? subTitle;
  final void Function()? onTap;

  const ArrowedProfileItemWidget({
    super.key,
    required this.title,
    this.titleColor,
    this.subTitle,
    this.onTap,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(color: d.theme.colorScheme.surface),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: d.typography.subTitle.copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: d.typography.body.copyWith(color: AppColors.blue),
                    ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
