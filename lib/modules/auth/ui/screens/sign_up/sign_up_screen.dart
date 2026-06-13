import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

import '../../../../../core/di/di.dart' show getIt;
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show EffectsHandlingMixin;
import 'sections/sign_up_actions_section.dart';
import 'sections/sign_up_form.dart';
import 'view_model/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen>
    with EffectsHandlingMixin<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpViewModel signUpViewModel = getIt.get();
  late final SignUpControllers signUpControllers;

  @override
  void initState() {
    super.initState();
    signUpControllers = SignUpControllers(
      fullNameController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      phoneNumberController: TextEditingController(),
      genderController: TextEditingController(),
    );
    signUpViewModel.effectStream.listen(handleEffects);
  }

  @override
  void dispose() {
    super.dispose();
    signUpControllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpViewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(appLocalizations.signUp), centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignUpForm(
                  formKey: formKey,
                  signUpControllers: signUpControllers,
                ),
                SignUpActionsSection(
                  formKey: formKey,
                  signUpController: signUpControllers,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    appLocalizations.termsAndPrivacy,
                    style: typography.body.copyWith(
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpControllers {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final TextEditingController genderController;

  SignUpControllers({
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.genderController,
  });

  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
  }
}
