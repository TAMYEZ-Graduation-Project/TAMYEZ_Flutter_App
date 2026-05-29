import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart'
    show CustomTextField;
import '../../../../../../core/validation/validators.dart' show Validators;

class LoginForm extends BaseStatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            hintText: d.appLocalizations.email,
            validatingFunc: Validators.validateEmail,
          ),
          CustomTextField(
            hintText: d.appLocalizations.password,
            isPassword: true,
            validatingFunc: Validators.validatePassword,
          ),
        ],
      ),
    );
  }
}
