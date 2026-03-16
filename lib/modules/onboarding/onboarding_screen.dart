import 'package:flutter/material.dart';

import '../../core/bases/base_stateless_widget.dart';
import '../../core/constants/asset_paths.dart';
import '../../core/routing/defined_routes.dart';
import 'widget/choose_language_widget.dart';

class OnboardingScreen extends BaseStatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetPaths.discoverCareerImage),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      d.appLocalizations.discoverYourTruePotential,
                      style: d.typography.title.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                          horizontal: 32.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              '${d.appLocalizations.chooseYourLanguage}\n',
                              style: d.typography.title,
                            ),
                            TextSpan(
                              text: d
                                  .appLocalizations
                                  .selectYourPreferredLanguage,
                              style: d.typography.subTitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // localization button
                    const ChooseLanguageWidget(),
                    const Spacer(),
                    FilledButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, DefinedRoutes.loginRoute);
                      },
                      child: Text(d.appLocalizations.continueWord),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
