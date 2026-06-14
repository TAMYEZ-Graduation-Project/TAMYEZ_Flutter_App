import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  final double? dimension;
  final bool center;

  const AppLoadingWidget({super.key, this.dimension, this.center = true});

  @override
  Widget build(BuildContext context) {
    return center
        ? Center(child: _LoadingWidget(dimension: dimension))
        : _LoadingWidget(dimension: dimension);
  }
}

class _LoadingWidget extends StatelessWidget {
  final double? dimension;

  const _LoadingWidget({this.dimension});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: CircularProgressIndicator(
        strokeWidth: dimension != null ? (dimension! / 7) : null,
      ),
    );
  }
}
