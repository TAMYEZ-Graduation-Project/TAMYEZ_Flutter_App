import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocSelector;

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../../core/validation/validators.dart';
import '../view_model/forget_password_intent.dart' show SubmitEmailIntent;
import '../view_model/forget_password_state.dart' show ForgetPasswordState;
import '../view_model/forget_password_view_model.dart'
    show ForgetPasswordViewModel;

class ForgetEmailPage extends BaseStatelessWidget {
  const ForgetEmailPage({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(d.appLocalizations.password),
        centerTitle: true,
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
                d.appLocalizations.forgotPassword,
                textAlign: TextAlign.center,
                style: d.typography.title.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                d.appLocalizations.pleaseEnterEmailAssociated,
                textAlign: TextAlign.center,
                style: d.typography.subTitle.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: emailController,
                hintText: d.appLocalizations.email,
                validatingFunc: Validators.validateEmail,
              ),
              const SizedBox(height: 32),
              BlocSelector<
                ForgetPasswordViewModel,
                ForgetPasswordState,
                UiResult<void>
              >(
                selector: (state) => state.forgetPasswordResult,
                builder: (context, forgetPasswordResult) {
                  return FilledButton(
                    onPressed: forgetPasswordResult is Loading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              context.read<ForgetPasswordViewModel>().doIntent(
                                SubmitEmailIntent(emailController.text),
                              );
                            }
                          },
                    child: forgetPasswordResult is Loading
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
