import 'package:flutter/material.dart';

import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/validation/validators.dart';

class ForgetPasswordScreen extends BaseStatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                style: d.typography.subTitle.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: emailController,
                hintText: d.appLocalizations.email,
                validatingFunc: Validators.validateEmail,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      DefinedRoutes.verificationCodeRoute,
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
