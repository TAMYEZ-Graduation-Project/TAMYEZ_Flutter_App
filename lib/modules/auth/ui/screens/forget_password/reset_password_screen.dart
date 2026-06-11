import 'package:flutter/material.dart';

import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/validation/validators.dart';

class ResetPasswordScreen extends BaseStatelessWidget {
  const ResetPasswordScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: formKey,
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
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      DefinedRoutes.loginRoute,
                      (route) => false,
                    );
                  }
                },
                child: Text(d.appLocalizations.continueWord),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
