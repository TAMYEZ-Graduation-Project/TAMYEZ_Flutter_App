import 'package:flutter/material.dart';

import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';

class VerificationCodeScreen extends BaseStatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Scaffold(
      appBar: AppBar(
        title: Text(d.appLocalizations.password),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              d.appLocalizations.emailVerification,
              textAlign: TextAlign.center,
              style: d.typography.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              d.appLocalizations.enterCodeSent,
              textAlign: TextAlign.center,
              style: d.typography.subTitle.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: AppColors.blue.withAlpha(13),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.red),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (index == 3 && value.isNotEmpty) {
                          Navigator.pushNamed(
                            context,
                            DefinedRoutes.resetPasswordRoute,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Text(
                  d.appLocalizations.invalidCode,
                  style: d.typography.label.copyWith(color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: d.appLocalizations.didNotReceiveCode,
                      style: d.typography.subTitle.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          // Resend logic
                        },
                        child: Text(
                          d.appLocalizations.resent,
                          style: d.typography.subTitle.copyWith(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
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
