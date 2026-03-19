import 'package:flutter/material.dart';

import '../../../core/bases/base_stateless_widget.dart';
import '../../../core/layers/localization/enums/languages_enum.dart';
import '../../../core/layers/theme/colors/app_colors.dart';
import '../constants/onboarding_screen_constants.dart';

class ChooseLanguageWidget extends BaseStatelessWidget {
  const ChooseLanguageWidget({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return Container(
      alignment: AlignmentGeometry.center,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                key: const Key(
                  OnboardingScreenConstants.chooseLanguageArabicButtonKey,
                ),
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  await d.localizationManager.changeLocal(LanguagesEnum.ar);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: d.localizationManager.isEnglish
                        ? Colors.transparent
                        : AppColors.lightGray,
                  ),
                  padding: const EdgeInsetsGeometry.all(14),

                  child: Text(
                    LanguagesEnum.ar.getLanguageName(),
                    textAlign: TextAlign.center,
                    style: d.typography.subTitle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                key: const Key(
                  OnboardingScreenConstants.chooseLanguageEnglishButtonKey,
                ),
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  await d.localizationManager.changeLocal(LanguagesEnum.en);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: d.localizationManager.isEnglish
                        ? AppColors.lightGray
                        : Colors.transparent,
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    LanguagesEnum.en.getLanguageName(),
                    textAlign: TextAlign.center,
                    style: d.typography.subTitle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
