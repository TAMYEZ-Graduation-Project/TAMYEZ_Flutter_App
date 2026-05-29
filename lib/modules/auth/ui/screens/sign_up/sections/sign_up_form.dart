import 'package:flutter/material.dart';

import '../../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart'
    show CustomTextField;
import '../../../../../../core/validation/validators.dart' show Validators;
import '../view_model/sign_up_state.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SignUpForm({super.key, required this.formKey});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends BaseStatefulWidgetState<SignUpForm> {
  GenderEnum? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(hintText: appLocalizations.fullName),
          CustomTextField(
            hintText: appLocalizations.email,
            validatingFunc: Validators.validateEmail,
          ),
          CustomTextField(
            hintText: appLocalizations.password,
            isPassword: true,
            validatingFunc: Validators.validatePassword,
          ),
          CustomTextField(
            hintText: appLocalizations.confirmPassword,
            isPassword: true,
            validatingFunc: Validators.validatePassword,
          ),
          CustomTextField(hintText: appLocalizations.phoneNumber),
          LayoutBuilder(
            builder: (context, constraints) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return RadioGroup<GenderEnum>(
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
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
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
