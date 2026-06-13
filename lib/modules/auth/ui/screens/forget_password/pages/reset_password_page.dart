import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../../core/validation/validators.dart';
import '../view_model/forget_password_intent.dart';
import '../view_model/forget_password_state.dart' show ForgetPasswordState;
import '../view_model/forget_password_view_model.dart';

class ResetPasswordPage extends BaseStatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(d.appLocalizations.password),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.read<ForgetPasswordViewModel>().doIntent(
              const PageNavigationIntent(1),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                d.appLocalizations.resetPassword,
                textAlign: TextAlign.center,
                style: d.typography.title.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                d.appLocalizations.passwordRequirements,
                textAlign: TextAlign.center,
                style: d.typography.subTitle.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: passwordController,
                hintText: d.appLocalizations.enterNewPassword,
                isPassword: true,
                validatingFunc: Validators.validatePassword,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: d.appLocalizations.confirmPassword,
                isPassword: true,
                validatingFunc: (value) => Validators.validateConfirmPassword(
                  value,
                  passwordController.text,
                ),
              ),
              const SizedBox(height: 32),
              BlocSelector<
                ForgetPasswordViewModel,
                ForgetPasswordState,
                UiResult<void>
              >(
                selector: (state) => state.resetPasswordResult,
                builder: (context, result) {
                  return FilledButton(
                    onPressed: result is Loading
                        ? null
                        : () {
                            context.read<ForgetPasswordViewModel>().doIntent(
                              ResetPasswordIntent(
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              ),
                            );
                          },
                    child: result is Loading
                        ? const AppLoadingWidget(dimension: 20)
                        : Text(d.appLocalizations.continueWord),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
