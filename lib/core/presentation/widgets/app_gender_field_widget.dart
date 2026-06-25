import 'package:flutter/material.dart';

import '../../../modules/auth/ui/screens/sign_up/view_model/sign_up_state.dart';
import '../../extensions/gender_enum_value.dart';
import '../../layers/theme/colors/app_colors.dart';
import '../../validation/validators.dart';
import '../bases/base_stateful_widget_state.dart';
import '../validation/form_validator.dart';

class AppGenderFieldWidget extends StatefulWidget {
  final TextEditingController genderController;
  final bool readOnly;

  const AppGenderFieldWidget({
    super.key,
    required this.genderController,
    this.readOnly = false,
  });

  @override
  State<AppGenderFieldWidget> createState() => _AppGenderFieldWidgetState();
}

class _AppGenderFieldWidgetState
    extends BaseStatefulWidgetState<AppGenderFieldWidget> {
  GenderEnum? selectedGender;

  @override
  void initState() {
    super.initState();
    if (widget.genderController.text.isNotEmpty) {
      selectedGender = widget.genderController.text.toGenderEnumValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FormField<String>(
          validator: widget.readOnly
              ? null
              : (value) {
                  return validateField(
                    appLocalizations,
                    value,
                    Validators.validateGender,
                  );
                },
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioGroup<GenderEnum>(
                  groupValue: selectedGender,
                  onChanged: widget.readOnly
                      ? (value) {}
                      : (value) {
                          setState(() {
                            state.didChange(value?.value);
                            selectedGender = value;
                            widget.genderController.text = value?.value ?? '';
                          });
                        },
                  child: Row(
                    children: [
                      Text(
                        appLocalizations.gender,
                        style: typography.subTitle.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.15),
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          leading: const Radio(value: GenderEnum.female),
                          title: Text(
                            appLocalizations.female,
                            style: typography.body,
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          leading: const Radio(value: GenderEnum.male),
                          title: Text(
                            appLocalizations.male,
                            style: typography.body,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.hasError)
                  Text(
                    state.errorText!,
                    style: typography.label.copyWith(
                      height: -0.5,
                      color: AppColors.red,
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
