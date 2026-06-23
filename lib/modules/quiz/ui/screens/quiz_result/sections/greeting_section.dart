import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';

class GreetingSection extends BaseStatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      children: [
        Text(
          d.appLocalizations.greatJob(
            userProvider.user!.fullName!.split(' ').first,
          ),
          style: d.typography.title,
        ),
        Text(
          d.appLocalizations.quizCompletionSummary,
          textAlign: TextAlign.center,
          style: d.typography.subTitle,
        ),
      ],
    );
  }
}
