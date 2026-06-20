import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class CareerDetailSectionHeader extends BaseStatelessWidget {
  final String title;

  const CareerDetailSectionHeader({super.key, required this.title});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: d.typography.title.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
