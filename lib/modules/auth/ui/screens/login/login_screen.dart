import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/error/failure_message_mapper.dart';
import '../../../../../core/presentation/extension/context_extension.dart';
import '../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/success/success_message_mapper.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/validation/validators.dart';
import 'view_model/login_intent.dart';
import 'view_model/login_state.dart';
import 'view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState<LoginScreen> {
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginViewModel _loginViewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    _loginViewModel.effectStream.listen((event) {
      switch (event) {
        case DisplayErrorEffect():
          displaySnackBar(
            contentType: ContentType.failure,
            title: FailureHandling.mapFailureToMessage(
              appLocalizations,
              event.failure,
            ),
          );
        case SuccessEffect():
          displaySnackBar(
            contentType: ContentType.success,
            title: SuccessHandling.mapSuccessToMessage(
              appLocalizations,
              event.success!,
            ),
          );
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginViewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(context.appLocalizations.loginScreen),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    hintText: context.appLocalizations.email,
                    validatingFunc: Validators.validateEmail,
                  ),
                  CustomTextField(
                    hintText: context.appLocalizations.password,
                    isPassword: true,
                    validatingFunc: Validators.validatePassword,
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
                        context.appLocalizations.rememberMe,
                        style: typography.subTitle.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          context.appLocalizations.forgotPassword,
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
                      context.appLocalizations.resendVerificationEmail,
                      style: typography.subTitle.copyWith(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
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
                            : Text(context.appLocalizations.signIn),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      context.appLocalizations.orSignInWith,
                      style: typography.title,
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
                                _loginViewModel.doIntent(
                                  const GoogleLoginIntent(),
                                );
                              },
                        child: state.googleLoginResult is Loading
                            ? const AppLoadingWidget(dimension: 20)
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetPaths.googleIcon,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    context.appLocalizations.google,
                                    style: typography.button.copyWith(
                                      color: AppColors.dark,
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: context.appLocalizations.dontHaveAnAccount,
                          style: typography.subTitle.copyWith(
                            color: AppColors.dark,
                          ),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              context.appLocalizations.signUp,
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
      ),
    );
  }
}
