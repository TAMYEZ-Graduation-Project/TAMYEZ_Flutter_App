import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

import '../../../../../../core/constants/asset_paths.dart' show AssetPaths;
import '../../../../../../core/layers/theme/colors/app_colors.dart'
    show AppColors;
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/result/ui_result.dart' show Loading;
import '../../../../../../core/presentation/widgets/app_loading_widget.dart'
    show AppLoadingWidget;
import '../view_model/login_intent.dart' show GoogleLoginIntent;
import '../view_model/login_state.dart' show LoginState;
import '../view_model/login_view_model.dart' show LoginViewModel;

class LoginActionsSection extends BaseStatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginActionsSection({super.key, required this.formKey});

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
                      formKey.currentState?.validate();
                    },
              child: state.systemLoginResult is Loading
                  ? const CircularProgressIndicator()
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
                      loginViewModel.doIntent(const GoogleLoginIntent());
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
                          style: d.typography.button.copyWith(
                            color: AppColors.dark,
                          ),
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
