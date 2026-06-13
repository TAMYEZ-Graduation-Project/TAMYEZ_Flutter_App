import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart' show getIt;
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart'
    show EffectsHandlingMixin;
import '../../../../../core/presentation/result/ui_effect.dart';
import 'pages/forget_email_page.dart';
import 'pages/reset_password_page.dart';
import 'pages/verification_code_page.dart';
import 'view_model/forget_password_view_model.dart'
    show ForgetPasswordViewModel;

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState
    extends BaseStatefulWidgetState<ForgetPasswordScreen>
    with EffectsHandlingMixin {
  final ForgetPasswordViewModel _viewModel = getIt.get();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _viewModel.effectStream.listen((event) {
      switch (event) {
        case PageNavigationEffect():
          _pageController.jumpToPage(event.page);
        default:
          handleEffects(event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _viewModel,
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ForgetEmailPage(),
          VerificationCodePage(),
          ResetPasswordPage(),
        ],
      ),
    );
  }
}
