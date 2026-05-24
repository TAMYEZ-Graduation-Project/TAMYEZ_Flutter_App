import 'package:flutter/material.dart';

import '../../../../core/presentation/bases/base_stateful_widget_state.dart'
    show BaseStatefulWidgetState;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Login Screen', style: typography.title)),
        ],
      ),
    );
  }
}
