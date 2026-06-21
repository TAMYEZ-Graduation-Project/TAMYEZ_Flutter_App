import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/bases/base_stateless_widget.dart'
    show BaseStatelessWidget;
import '../../../../core/presentation/break_points/custom_breakpoints.dart'
    show CustomBreakpoints;
import 'views/mobile_view.dart';
import 'views/tablet_or_desktop_view.dart';

class OnboardingScreen extends BaseStatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget buildWith(BuildContext context, d) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          breakpointProvider: CustomBreakpoints(),
          mobile: const MobileView(),
          tablet: const TabletOrDesktopView(),
          desktop: const TabletOrDesktopView(),
        ),
      ),
    );
  }
}
