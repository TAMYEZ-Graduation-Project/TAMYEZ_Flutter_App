import 'package:flutter/material.dart';

import '../../../core/constants/asset_paths.dart' show AssetPaths;
import '../../../core/layers/theme/colors/app_colors.dart' show AppColors;
import '../../../core/presentation/bases/base_stateless_widget.dart'
    show BaseStatelessWidget;
import '../../../core/presentation/extension/context_extension.dart'
    show ContextExtension;
import '../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../constants/onboarding_screen_constants.dart'
    show OnboardingScreenConstants;
import '../widget/choose_language_widget.dart';

class TabletOrDesktopView extends BaseStatelessWidget {
  const TabletOrDesktopView({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                ColoredBox(
                  color: AppColors.lightGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * (45 / 100),
                        child: Image.asset(
                          key: const Key(
                            OnboardingScreenConstants.discoverCareerImageKey,
                          ),
                          AssetPaths.discoverCareerImage,
                          cacheWidth: 390,
                          cacheHeight: 320,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: constraints.maxHeight * (13 / 100),
              child: SizedBox(
                width: constraints.maxWidth * (45 / 100),
                //height: constraints.maxHeight * (40 / 100),
                child: Card(
                  color: AppColors.light,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      key: const Key(
                        OnboardingScreenConstants.onboardingColumnKey,
                      ),
                      spacing: constraints.maxHeight * (3 / 100),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          context.appLocalizations.discoverYourTruePotential,
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
                                      '${context.appLocalizations.chooseYourLanguage}\n',
                                  style: d.typography.title,
                                ),
                                TextSpan(
                                  text: context
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
                        SizedBox(height: constraints.maxHeight * (3 / 100)),
                        FilledButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              DefinedRoutes.loginRoute,
                            );
                          },
                          child: Text(context.appLocalizations.continueWord),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
