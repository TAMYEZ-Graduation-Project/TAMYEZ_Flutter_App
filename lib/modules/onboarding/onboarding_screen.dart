import 'package:flutter/material.dart';
import 'package:tamyez_app/core/bases/base_stateless_widget.dart';
import 'package:tamyez_app/core/constants/asset_paths.dart';

class OnboardingScreen extends BaseStatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 30,
          crossAxisAlignment: .stretch,
          children: [
            Image.asset(AssetPaths.discoverCareerImage),
            Padding(
              padding: const .symmetric(horizontal: 16),
              child: Text(
                d.appLocalizations.discoverYourTruePotential,
                style: d.typography.title.copyWith(fontSize: 16),
                textAlign: .center,
              ),
            ),
            Padding(
              padding: const .symmetric(horizontal: 32.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${d.appLocalizations.chooseYourLanguage}\n",
                      style: d.typography.title,
                    ),
                    TextSpan(
                      text: d.appLocalizations.selectYourPreferredLanguage,
                      style: d.typography.subTitle,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
            Padding(
              padding: const .symmetric(horizontal: 18.0, vertical: 8),
              child: FilledButton(
                onPressed: () {},
                child: Text(d.appLocalizations.continueWord),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
