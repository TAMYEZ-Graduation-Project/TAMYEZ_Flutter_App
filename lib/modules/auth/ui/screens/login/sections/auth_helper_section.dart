import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart'
    show AppColors;
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;

class AuthHelperSection extends BaseStatelessWidget {
  final ValueNotifier<bool> rememberMe;

  const AuthHelperSection({super.key, required this.rememberMe});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Column(
      children: [
        Row(
          children: [
            ValueListenableBuilder(
              valueListenable: rememberMe,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: value,
                    onChanged: (value) {
                      rememberMe.value = value ?? false;
                    },
                  ),
                );
              },
            ),
            Text(
              d.appLocalizations.rememberMe,
              style: d.typography.subTitle.copyWith(color: AppColors.blue),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, DefinedRoutes.forgetPasswordRoute);
              },
              child: Text(
                d.appLocalizations.forgotPassword,
                style: d.typography.body.copyWith(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            d.appLocalizations.resendVerificationEmail,
            style: d.typography.subTitle.copyWith(
              color: AppColors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
