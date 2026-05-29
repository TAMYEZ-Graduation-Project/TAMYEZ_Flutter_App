import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

import '../../../../../core/di/di.dart' show getIt;
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/error/failure_message_mapper.dart'
    show FailureHandling;
import '../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../core/presentation/success/success_message_mapper.dart'
    show SuccessHandling;
import 'sections/sign_up_actions_section.dart';
import 'sections/sign_up_form.dart';
import 'view_model/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpViewModel signUpViewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    signUpViewModel.effectStream.listen((event) {
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
      create: (context) => signUpViewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(appLocalizations.signUp), centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignUpForm(formKey: formKey),
                SignUpActionsSection(formKey: formKey),
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
