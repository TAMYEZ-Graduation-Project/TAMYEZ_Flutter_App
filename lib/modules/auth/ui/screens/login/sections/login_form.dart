import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart'
    show CustomTextField;
import '../../../../../../core/validation/validators.dart' show Validators;
import '../login_screen.dart' show LoginControllers;

class LoginForm extends BaseStatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginControllers loginControllers;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.loginControllers,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            controller: loginControllers.emailController,
            hintText: d.appLocalizations.email,
            validatingFunc: Validators.validateEmail,
          ),
          CustomTextField(
            controller: loginControllers.passwordController,
            hintText: d.appLocalizations.password,
            isPassword: true,
            validatingFunc: Validators.validatePassword,
          ),
        ],
      ),
    );
  }
}
