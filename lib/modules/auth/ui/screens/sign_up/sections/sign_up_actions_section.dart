import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

import '../../../../../../core/constants/asset_paths.dart' show AssetPaths;
import '../../../../../../core/layers/theme/colors/app_colors.dart'
    show AppColors;
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/widgets/app_loading_widget.dart'
    show AppLoadingWidget;
import '../view_model/sign_up_intent.dart';
import '../view_model/sign_up_state.dart' show SignUpState;
import '../view_model/sign_up_view_model.dart' show SignUpViewModel;

class SignUpActionsSection extends BaseStatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpActionsSection({super.key, required this.formKey});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final SignUpViewModel signUpViewModel = context.read();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<SignUpViewModel, SignUpState>(
          builder: (context, state) {
            return FilledButton(
              onPressed:
                  state.systemSignUpResult is Loading ||
                      state.googleSignUpResult is Loading
                  ? null
                  : () {
                      formKey.currentState?.validate();
                    },
              child: state.systemSignUpResult is Loading
                  ? const CircularProgressIndicator()
                  : Text(d.appLocalizations.signUp),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            d.appLocalizations.orSignUpWith,
            style: d.typography.title,
          ),
        ),
        BlocBuilder<SignUpViewModel, SignUpState>(
          builder: (context, state) {
            return OutlinedButton(
              onPressed:
                  state.googleSignUpResult is Loading ||
                      state.systemSignUpResult is Loading
                  ? null
                  : () {
                      signUpViewModel.doIntent(const GoogleSignUpIntent());
                    },
              child: state.googleSignUpResult is Loading
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
