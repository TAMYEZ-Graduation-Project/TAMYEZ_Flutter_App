import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class EndRoadmapStep extends BaseStatelessWidget {
  final TextDirection textDirection;

  const EndRoadmapStep({super.key, this.textDirection = TextDirection.ltr});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Directionality(
      textDirection: textDirection,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -4,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.dark,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 26.0),
                  child: Flexible(
                    child: Container(
                      height: 1.5,
                      decoration: BoxDecoration(color: AppColors.dark),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Foundational Programming',
                          style: d.typography.body,
                        ),
                        Text('Upcoming', style: d.typography.body),
                      ],
                    ),
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: textDirection == TextDirection.ltr ? 26.0 : 0,
                    left: textDirection == TextDirection.rtl ? 26.0 : 0,
                  ),
                  child: Flexible(
                    child: Container(
                      height: 1.5,
                      decoration: BoxDecoration(color: AppColors.dark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
