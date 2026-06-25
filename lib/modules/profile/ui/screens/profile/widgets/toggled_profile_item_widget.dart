import 'package:flutter/material.dart';

import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/bases/base_stateful_widget_state.dart';

class ToggledProfileItemWidget extends StatefulWidget {
  final String title;
  final Color? titleColor;
  final String? subTitle;
  final bool toggleOn;
  final void Function(bool value)? onTap;

  const ToggledProfileItemWidget({
    super.key,
    required this.title,
    this.titleColor,
    this.subTitle,
    this.onTap,
    this.toggleOn = false,
  });

  @override
  State<ToggledProfileItemWidget> createState() =>
      _ToggledProfileItemWidgetState();
}

class _ToggledProfileItemWidgetState
    extends BaseStatefulWidgetState<ToggledProfileItemWidget> {
  late bool _toggleOn;

  @override
  void initState() {
    super.initState();
    _toggleOn = widget.toggleOn;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _toggleOn = !_toggleOn;
          widget.onTap?.call(_toggleOn);
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.lightBlue),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: typography.subTitle.copyWith(
                      color: widget.titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.subTitle != null)
                    Text(
                      widget.subTitle!,
                      style: typography.body.copyWith(color: AppColors.blue),
                    ),
                ],
              ),
              Switch(
                value: _toggleOn,
                onChanged: (value) {
                  setState(() {
                    _toggleOn = !_toggleOn;
                    widget.onTap?.call(_toggleOn);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
