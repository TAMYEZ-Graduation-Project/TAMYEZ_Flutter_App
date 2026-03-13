import 'package:flutter/material.dart';
import 'package:tamyez_app/core/bases/base_stateless_widget.dart';
import 'package:tamyez_app/core/constants/asset_paths.dart';
import 'package:tamyez_app/core/routing/defined_routes.dart';
import 'package:tamyez_app/modules/onboarding/widget/choose_language_widget.dart';

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
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      d.appLocalizations.discoverYourTruePotential,
                      style: d.typography.title.copyWith(fontSize: 16),
                      textAlign: .center,
                    ),
                    Padding(
                      padding: const .symmetric(horizontal: 32.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${d.appLocalizations.chooseYourLanguage}\n",
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
                      onPressed: () {
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
