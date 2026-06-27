import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../../core/presentation/widgets/app_gender_field_widget.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart'
    show CustomTextField;
import '../../../../../../core/validation/validators.dart' show Validators;
import '../sign_up_screen.dart';

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
          AppGenderFieldWidget(genderController: controllers.genderController),
        ],
      ),
    );
  }
}
