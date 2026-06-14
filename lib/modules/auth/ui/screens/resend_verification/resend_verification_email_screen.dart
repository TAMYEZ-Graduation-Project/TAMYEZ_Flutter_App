import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart' show getIt;
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show EffectsHandlingMixin;
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/validation/validators.dart';
import 'view_model/resend_verification_email_event.dart';
import 'view_model/resend_verification_email_state.dart'
    show ResendVerificationEmailState;
import 'view_model/resend_verification_email_view_model.dart'
    show ResendVerificationEmailViewModel;

class ResendVerificationEmailScreen extends StatefulWidget {
  const ResendVerificationEmailScreen({super.key});

  @override
  State<ResendVerificationEmailScreen> createState() =>
      _ResendVerificationEmailScreenState();
}

class _ResendVerificationEmailScreenState
    extends BaseStatefulWidgetState<ResendVerificationEmailScreen>
    with EffectsHandlingMixin {
  final ResendVerificationEmailViewModel _viewModel = getIt.get();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _viewModel.effectStream.listen(handleEffects);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Verify your email'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Please verify your email address to continue.\nWe've sent a verification link to your inbox.",
                  textAlign: TextAlign.center,
                  style: typography.subTitle,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: appLocalizations.email,
                  validatingFunc: Validators.validateEmail,
                ),
                const SizedBox(height: 20),

                BlocSelector<
                  ResendVerificationEmailViewModel,
                  ResendVerificationEmailState,
                  UiResult<void>
                >(
                  selector: (state) => state.resendVerificationEmailResult,
                  builder: (context, state) {
                    return FilledButton(
                      onPressed: state is Loading
                          ? null
                          : () {
                              if (!_formKey.currentState!.validate()) return;
                              _viewModel.doIntent(
                                ResendOtpIntent(_emailController.text),
                              );
                            },
                      child: state is Loading
                          ? const AppLoadingWidget(dimension: 20)
                          : const Text('Resend verification email'),
                    );
                  },
                ),

                const SizedBox(height: 20),
                Text(
                  "Didn't receive the email? Check your spam folder ",
                  style: typography.body.copyWith(color: AppColors.blue),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
