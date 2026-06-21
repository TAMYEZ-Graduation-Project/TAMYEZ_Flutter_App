import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class InnerRoadmapStep extends BaseStatelessWidget {
  final TextDirection textDirection;

  const InnerRoadmapStep({super.key, this.textDirection = TextDirection.ltr});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Flexible(
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(color: AppColors.dark),
            ),
          ),
        ),
        Directionality(
          textDirection: textDirection,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 2,
                    height: 25,
                    decoration: BoxDecoration(color: AppColors.dark),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade50,
                      border: Border.all(
                        color: Colors.green.shade200,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.check, color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 25,
                    decoration: BoxDecoration(color: AppColors.dark),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text('Foundational Programming', style: d.typography.body),
                  Text('Upcoming', style: d.typography.body),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
