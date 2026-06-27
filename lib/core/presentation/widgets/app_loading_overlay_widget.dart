import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../bases/base_stateless_widget.dart';
import 'app_loading_widget.dart';

class AppLoadingOverlayWidget extends BaseStatelessWidget {
  const AppLoadingOverlayWidget({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(90), // smoother dim
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const AppLoadingWidget(),
                          const SizedBox(height: 16),
                          Text('Loading...', style: d.typography.body),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
