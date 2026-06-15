import 'package:flutter/material.dart';

import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';

class DiscoverYourPotentialScreen extends BaseStatelessWidget {
  const DiscoverYourPotentialScreen({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [0.4, 0.6],
                  colors: [AppColors.lightCoffee, AppColors.middleCoffee],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      AssetPaths.discoverYourPotential,
                      cacheWidth: 390,
                      cacheHeight: 320,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              d.appLocalizations.discoverYourTruePotentialTitle,
              textAlign: TextAlign.center,
              style: d.typography.hero.copyWith(color: AppColors.dark),
            ),
            Text(
              d.appLocalizations.discoverYourTruePotentialSubtitle,
              textAlign: TextAlign.center,
              style: d.typography.subTitle,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    DefinedRoutes.careerAssessmentRoute,
                  );
                },
                child: Text(d.appLocalizations.getStarted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
