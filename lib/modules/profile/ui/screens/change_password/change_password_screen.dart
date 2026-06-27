import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/validation/validators.dart';
import 'change_password_view_model/change_password_intent.dart';
import 'change_password_view_model/change_password_state.dart';
import 'change_password_view_model/change_password_view_model.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends BaseStatefulWidgetState<ChangePasswordScreen>
    with EffectsHandlingMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ChangePasswordViewModel viewModel = getIt.get();
  final TextEditingController currentPasswordController =
          TextEditingController(),
      newPasswordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.effectStream.listen(handleEffects);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.changePassword),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 24,
                children: [
                  CustomTextField(
                    controller: currentPasswordController,
                    hintText: appLocalizations.currentPassword,
                    isPassword: true,
                    validatingFunc: Validators.validatePassword,
                  ),
                  CustomTextField(
                    controller: newPasswordController,
                    hintText: appLocalizations.newPassword,
                    isPassword: true,
                    validatingFunc: (value) => Validators.validateNewPassword(
                      value,
                      currentPasswordController.text,
                    ),
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: appLocalizations.confirmPassword,
                    isPassword: true,
                    validatingFunc: (value) =>
                        Validators.validateConfirmPassword(
                          value,
                          newPasswordController.text,
                        ),
                  ),
                  BlocSelector<
                    ChangePasswordViewModel,
                    ChangePasswordState,
                    UiResult<void>
                  >(
                    selector: (state) => state.changePasswordResult,
                    builder: (context, result) {
                      return FilledButton(
                        onPressed: result is Loading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  viewModel.doIntent(
                                    ChangeUserPasswordIntent(
                                      currentPassword:
                                          currentPasswordController.text,
                                      newPassword: newPasswordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    ),
                                  );
                                }
                              },
                        child: result is Loading
                            ? const AppLoadingWidget(dimension: 20)
                            : Text(appLocalizations.change),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
