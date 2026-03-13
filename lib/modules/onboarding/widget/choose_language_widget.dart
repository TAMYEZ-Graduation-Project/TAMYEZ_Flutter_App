import 'package:flutter/material.dart';
import 'package:tamyez_app/core/bases/base_stateless_widget.dart';
import 'package:tamyez_app/core/layers/localization/enums/languages_enum.dart';
import 'package:tamyez_app/core/layers/theme/colors/app_colors.dart';

class ChooseLanguageWidget extends BaseStatelessWidget {
  const ChooseLanguageWidget({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return Container(
      alignment: .center,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Directionality(
        textDirection: .ltr,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  d.localizationManager.changeLocal(LanguagesEnum.ar);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: d.localizationManager.isEnglish
                        ? Colors.transparent
                        : AppColors.lightGray,
                  ),
                  padding: const .all(14),
                  child: Text(
                    LanguagesEnum.ar.getLanguageName(),
                    textAlign: .center,
                    style: d.typography.subTitle.copyWith(fontWeight: .w700),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  d.localizationManager.changeLocal(LanguagesEnum.en);
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
                    textAlign: .center,
                    style: d.typography.subTitle.copyWith(fontWeight: .w700),
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
