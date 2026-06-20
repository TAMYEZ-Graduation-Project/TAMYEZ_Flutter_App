import 'package:flutter/material.dart';

import '../../../../core/presentation/bases/base_stateful_widget_state.dart'
    show BaseStatefulWidgetState;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(appLocalizations.homeScreen, style: typography.title),
          ),
        ],
      ),
    );
  }
}
