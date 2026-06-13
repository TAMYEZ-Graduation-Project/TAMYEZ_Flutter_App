import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/time_formatting.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../view_model/forget_password_intent.dart'
    show VerifyCodeIntent, PageNavigationIntent, ResendOtpCodeIntent;
import '../view_model/forget_password_state.dart' show ForgetPasswordState;
import '../view_model/forget_password_view_model.dart';
import '../widget/custom_otp_field.dart';

class VerificationCodePage extends BaseStatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final List<String> otpCodeList = ['', '', '', '', '', ''];
    final int otpLength = otpCodeList.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(d.appLocalizations.password),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.read<ForgetPasswordViewModel>().doIntent(
              const PageNavigationIntent(0),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: List.generate(otpLength, (index) {
                return BlocSelector<
                  ForgetPasswordViewModel,
                  ForgetPasswordState,
                  UiResult<void>
                >(
                  selector: (state) => state.verifyCodeResult,
                  builder: (context, result) {
                    return CustomOtpField(
                      forceErrorText: result is Error ? '' : null,
                      onChange: (value) {
                        otpCodeList[index] = value;
                        if (value.isNotEmpty && index < otpLength - 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                        if (index == otpLength - 1 && value.isNotEmpty) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.read<ForgetPasswordViewModel>().doIntent(
                            VerifyCodeIntent(otpCodeList.join()),
                          );
                        }
                      },
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 8),
            BlocSelector<
              ForgetPasswordViewModel,
              ForgetPasswordState,
              UiResult<void>
            >(
              selector: (state) => state.verifyCodeResult,
              builder: (context, verifyCodeResult) {
                switch (verifyCodeResult) {
                  case Loading<void>():
                    return const AppLoadingWidget(dimension: 25);
                  case Initial<void>():
                  case Success<void>():
                    return const SizedBox.shrink();
                  case Error<void>():
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: AppColors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          d.appLocalizations.invalidCode,
                          style: d.typography.label.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    );
                }
              },
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
                      child:
                          BlocSelector<
                            ForgetPasswordViewModel,
                            ForgetPasswordState,
                            UiResult<void>
                          >(
                            selector: (state) => state.resendOtpCodeResult,
                            builder: (context, result) {
                              if (result is Loading) {
                                return const AppLoadingWidget(
                                  dimension: 20,
                                  center: false,
                                );
                              }
                              return BlocSelector<
                                ForgetPasswordViewModel,
                                ForgetPasswordState,
                                int
                              >(
                                selector: (state) =>
                                    state.timeRemainingForNextResend,
                                builder: (context, timeRemaining) {
                                  if (timeRemaining > 0) {
                                    return Text(
                                      timeRemaining.toTimeFormat(),
                                      style: d.typography.subTitle.copyWith(
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                      ),
                                    );
                                  }
                                  return InkWell(
                                    onTap: () {
                                      context
                                          .read<ForgetPasswordViewModel>()
                                          .doIntent(
                                            const ResendOtpCodeIntent(),
                                          );
                                    },
                                    child: Text(
                                      d.appLocalizations.resent,
                                      style: d.typography.subTitle.copyWith(
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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
