import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show EffectsHandlingMixin;
import '../../../../../core/presentation/routing/defined_routes.dart';
import 'sections/auth_helper_section.dart';
import 'sections/login_actions_section.dart';
import 'sections/login_form.dart';
import 'view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState<LoginScreen>
    with EffectsHandlingMixin<LoginScreen> {
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginViewModel _loginViewModel = getIt.get();

  late final LoginControllers loginControllers;

  @override
  void initState() {
    super.initState();
    loginControllers = LoginControllers(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
    );
    _loginViewModel.effectStream.listen(handleEffects);
  }

  @override
  void dispose() {
    super.dispose();
    loginControllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginViewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appLocalizations.loginScreen),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginForm(formKey: formKey, loginControllers: loginControllers),
                AuthHelperSection(rememberMe: rememberMe),
                LoginActionsSection(
                  formKey: formKey,
                  loginControllers: loginControllers,
                  rememberMe: rememberMe,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: appLocalizations.dontHaveAnAccount,
                        style: typography.subTitle.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.signUpRoute,
                            );
                          },
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
      ),
    );
  }
}

class LoginControllers {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginControllers({
    required this.emailController,
    required this.passwordController,
  });

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
