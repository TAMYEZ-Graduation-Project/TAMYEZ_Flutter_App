import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/error/failure_message_mapper.dart';
import '../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/success/success_message_mapper.dart';
import 'sections/auth_helper_section.dart';
import 'sections/login_actions_section.dart';
import 'sections/login_form.dart';
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
            title: appLocalizations.error,
            message: FailureHandling.mapFailureToMessage(
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
                LoginForm(formKey: formKey),
                AuthHelperSection(rememberMe: rememberMe),
                LoginActionsSection(formKey: formKey),
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
