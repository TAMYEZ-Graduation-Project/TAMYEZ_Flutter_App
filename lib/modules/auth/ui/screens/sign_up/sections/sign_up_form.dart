import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart'
    show AppColors;
import '../../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../../core/presentation/validation/form_validator.dart'
    show validateField;
import '../../../../../../core/presentation/widgets/custom_text_field.dart'
    show CustomTextField;
import '../../../../../../core/validation/validators.dart' show Validators;
import '../sign_up_screen.dart';
import '../view_model/sign_up_state.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final SignUpControllers signUpControllers;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.signUpControllers,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends BaseStatefulWidgetState<SignUpForm> {
  late final SignUpControllers controllers;
  GenderEnum? selectedGender;

  @override
  void initState() {
    super.initState();
    controllers = widget.signUpControllers;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            controller: controllers.fullNameController,
            hintText: appLocalizations.fullName,
            validatingFunc: Validators.validateFullName,
          ),
          CustomTextField(
            controller: controllers.emailController,
            hintText: appLocalizations.email,
            validatingFunc: Validators.validateEmail,
          ),
          CustomTextField(
            controller: controllers.passwordController,
            hintText: appLocalizations.password,
            isPassword: true,
            validatingFunc: Validators.validatePassword,
          ),
          CustomTextField(
            controller: controllers.confirmPasswordController,
            hintText: appLocalizations.confirmPassword,
            isPassword: true,
            validatingFunc: (value) {
              return Validators.validateConfirmPassword(
                value,
                controllers.passwordController.text,
              );
            },
          ),
          CustomTextField(
            controller: controllers.phoneNumberController,
            hintText: appLocalizations.phoneNumber,
            validatingFunc: Validators.validatePhoneNumber,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return FormField<String>(
                validator: (value) {
                  return validateField(
                    appLocalizations,
                    value,
                    Validators.validateGender,
                  );
                },
                builder: (state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          return RadioGroup<GenderEnum>(
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                state.didChange(value?.value);
                                selectedGender = value;
                                controllers.genderController.text =
                                    value?.value ?? '';
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  appLocalizations.gender,
                                  style: typography.subTitle.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.15),
                                Flexible(
                                  child: ListTile(
                                    horizontalTitleGap: 0,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    leading: const Radio(
                                      value: GenderEnum.female,
                                    ),
                                    title: Text(
                                      appLocalizations.female,
                                      style: typography.body,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    horizontalTitleGap: 0,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    leading: const Radio(
                                      value: GenderEnum.male,
                                    ),
                                    title: Text(
                                      appLocalizations.male,
                                      style: typography.body,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      if (state.hasError)
                        Text(
                          state.errorText!,
                          style: typography.label.copyWith(
                            height: -0.5,
                            color: AppColors.red,
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
