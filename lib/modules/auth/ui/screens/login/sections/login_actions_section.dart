import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

import '../../../../../../core/constants/asset_paths.dart' show AssetPaths;
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/result/ui_result.dart' show Loading;
import '../../../../../../core/presentation/widgets/app_loading_widget.dart'
    show AppLoadingWidget;
import '../login_screen.dart' show LoginControllers;
import '../view_model/login_intent.dart'
    show GmailLoginIntent, SystemLoginIntent;
import '../view_model/login_state.dart' show LoginState;
import '../view_model/login_view_model.dart' show LoginViewModel;

class LoginActionsSection extends BaseStatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginControllers loginControllers;
  final ValueNotifier<bool> rememberMe;

  const LoginActionsSection({
    super.key,
    required this.formKey,
    required this.loginControllers,
    required this.rememberMe,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final loginViewModel = context.read<LoginViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<LoginViewModel, LoginState>(
          builder: (context, state) {
            return FilledButton(
              onPressed:
                  state.systemLoginResult is Loading ||
                      state.googleLoginResult is Loading
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        loginViewModel.doIntent(
                          SystemLoginIntent(
                            email: loginControllers.emailController.text,
                            password: loginControllers.passwordController.text,
                            rememberMe: rememberMe.value,
                          ),
                        );
                      }
                    },
              child: state.systemLoginResult is Loading
                  ? const AppLoadingWidget(dimension: 20)
                  : Text(d.appLocalizations.signIn),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            d.appLocalizations.orSignInWith,
            style: d.typography.title,
          ),
        ),
        BlocBuilder<LoginViewModel, LoginState>(
          builder: (context, state) {
            return OutlinedButton(
              onPressed:
                  state.googleLoginResult is Loading ||
                      state.systemLoginResult is Loading
                  ? null
                  : () {
                      loginViewModel.doIntent(const GmailLoginIntent());
                    },
              child: state.googleLoginResult is Loading
                  ? const AppLoadingWidget(dimension: 20)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AssetPaths.googleIcon, height: 24),
                        const SizedBox(width: 8),
                        Text(
                          d.appLocalizations.google,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}
