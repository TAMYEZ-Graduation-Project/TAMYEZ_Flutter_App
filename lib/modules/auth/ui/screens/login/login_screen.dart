import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart'
    show CustomTextField;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState<LoginScreen> {
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appLocalizations.loginScreen),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                hintText: appLocalizations.email,
                validator: validateFunctions.validationOfEmail,
              ),
              CustomTextField(
                hintText: appLocalizations.password,
                isPassword: true,
                validator: validateFunctions.validationOfPassword,
              ),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: rememberMe,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          value: value,
                          onChanged: (value) {
                            rememberMe.value = value ?? false;
                          },
                        ),
                      );
                    },
                  ),
                  Text(
                    appLocalizations.rememberMe,
                    style: typography.subTitle.copyWith(color: AppColors.blue),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      appLocalizations.forgotPassword,
                      style: typography.body.copyWith(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  appLocalizations.resendVerificationEmail,
                  style: typography.subTitle.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {},
                child: Text(appLocalizations.signIn),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  appLocalizations.orSignInWith,
                  style: typography.title,
                ),
              ),
              if (GoogleSignIn.instance.supportsAuthenticate())
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await GoogleSignIn.instance.authenticate();
                    } catch (e) {
                      // ···
                    }
                  },
                  child: const Text('SIGN IN'),
                ),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPaths.googleIcon, height: 24),
                    const SizedBox(width: 8),
                    Text(
                      appLocalizations.google,
                      style: typography.button.copyWith(color: AppColors.dark),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: appLocalizations.dontHaveAnAccount,
                      style: typography.subTitle.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          appLocalizations.signUp,
                          style: typography.subTitle.copyWith(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
