import 'package:flutter/material.dart';

import '../../../core/bases/base_stateless_widget.dart';
import '../../../core/constants/asset_paths.dart' show AssetPaths;
import '../../../core/layers/theme/colors/app_colors.dart' show AppColors;
import '../../../core/routing/defined_routes.dart' show DefinedRoutes;
import '../widget/choose_language_widget.dart';

class MobileView extends BaseStatelessWidget {
  const MobileView({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return Column(
      children: [
        ColoredBox(
          color: AppColors.lightGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  AssetPaths.discoverCareerImage,
                  cacheWidth: 390,
                  cacheHeight: 320,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  spacing: constraints.maxHeight * (5 / 100),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      d.appLocalizations.discoverYourTruePotential,
                      style: d.typography.title.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 32.0,
                      ),
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
