import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/widgets/app_gender_field_widget.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../../core/validation/validators.dart';
import '../edit_profile_screen.dart';
import '../view_model/edit_profile_intent.dart';
import '../view_model/edit_profile_state.dart';
import '../view_model/edit_profile_view_model.dart';

class EditProfileFormSection extends BaseStatelessWidget {
  final EditProfileControllers controllers;
  final GlobalKey<FormState> formKey;

  const EditProfileFormSection({
    super.key,
    required this.formKey,
    required this.controllers,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final viewModel = context.read<EditProfileViewModel>();
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        spacing: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomTextField(
                  controller: controllers.firstNameController,
                  hintText: d.appLocalizations.firstName,
                  validatingFunc: Validators.validateName,
                  onChanged: (value) {
                    viewModel.doIntent(
                      OnFieldsChangeIntent(
                        firstName: controllers.firstNameController.text,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: CustomTextField(
                  controller: controllers.lastNameController,
                  hintText: d.appLocalizations.lastName,
                  validatingFunc: Validators.validateName,
                  onChanged: (value) {
                    viewModel.doIntent(
                      OnFieldsChangeIntent(
                        lastName: controllers.lastNameController.text,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          CustomTextField(
            controller: controllers.emailController,
            hintText: d.appLocalizations.email,
            readOnly: true,
            validatingFunc: Validators.validateEmail,
          ),
          CustomTextField(
            controller: controllers.phoneNumberController,
            hintText: d.appLocalizations.phoneNumber,
            validatingFunc: Validators.validatePhoneNumber,
            onChanged: (value) {
              viewModel.doIntent(
                OnFieldsChangeIntent(
                  phoneNumber: controllers.phoneNumberController.text,
                ),
              );
            },
          ),
          BlocBuilder<EditProfileViewModel, EditProfileState>(
              buildWhen: (previous, current) {
                return previous.originUser.gender != current.originUser.gender;
              },
              builder: (context, state) {
                return AppGenderFieldWidget(
                  genderController: controllers.genderController,
                  readOnly: controllers.genderController.text.isNotEmpty,
                  onChanged: (value) {
                    viewModel.doIntent(
                      OnFieldsChangeIntent(
                          gender: controllers.genderController.text),
                    );
                  },
                );
              }
          ),
        ],
      ),
    );
  }
}
