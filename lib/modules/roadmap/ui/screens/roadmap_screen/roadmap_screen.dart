import 'package:flutter/material.dart';

import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import 'widgets/end_roadmap_step.dart';
import 'widgets/inner_roadmap_step.dart';
import 'widgets/start_roadmap_step.dart';

class RoadmapPage extends StatefulWidget {
  const RoadmapPage({super.key});

  @override
  State<RoadmapPage> createState() => _RoadmapPageState();
}

class _RoadmapPageState extends BaseStatefulWidgetState<RoadmapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Career Roadmap'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: ListView(
          children: const [
            StartRoadmapStep(textDirection: TextDirection.rtl),
            InnerRoadmapStep(textDirection: TextDirection.rtl),
            InnerRoadmapStep(),
            EndRoadmapStep(),
          ],
        ),
      ),
    );
  }
}
