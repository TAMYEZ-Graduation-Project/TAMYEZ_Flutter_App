import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  final double? dimension;

  const AppLoadingWidget({super.key, this.dimension});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: CircularProgressIndicator(
          strokeWidth: dimension != null ? (dimension! / 7) : null,
        ),
      ),
    );
  }
}
