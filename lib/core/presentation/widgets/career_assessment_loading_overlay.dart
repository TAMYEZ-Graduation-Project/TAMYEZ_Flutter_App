import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/asset_paths.dart' show AssetPaths;
import '../../layers/theme/colors/app_colors.dart';
import '../bases/base_stateless_widget.dart';

class CareerAssessmentLoadingOverlay extends BaseStatelessWidget {
  const CareerAssessmentLoadingOverlay({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black.withAlpha(128)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: RepaintBoundary(
                  child: LottieBuilder.asset(AssetPaths.robotAnimation),
                ),
              ),
              Text(
                d.appLocalizations.checkingAnswers,
                textAlign: TextAlign.center,
                style: d.typography.subTitle.copyWith(color: AppColors.light),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
