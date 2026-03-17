import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';

import '../../core/bases/base_stateless_widget.dart';
import '../../core/screen/custom_breakpoints.dart';
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
