import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/widgets/app_loading_overlay_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_widget.dart';
import 'sections/edit_profile_form_section.dart';
import 'sections/edit_profile_header.dart';
import 'view_model/edit_profile_intent.dart';
import 'view_model/edit_profile_state.dart';
import 'view_model/edit_profile_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends BaseStatefulWidgetState<EditProfileScreen>
    with EffectsHandlingMixin {
  final EditProfileViewModel _viewModel = getIt.get();
  late GlobalKey<FormState> formKey;
  late EditProfileControllers controllers;

  @override
  void initState() {
    super.initState();
    _viewModel.effectStream.listen((event) {
      switch (event) {
        case ReinitDataEffect():
          initControllers();
        default:
          handleEffects(event);
      }
    });
    formKey = GlobalKey<FormState>();
    controllers = EditProfileControllers(
      firstNameController: TextEditingController(),
      lastNameController: TextEditingController(),
      emailController: TextEditingController(),
      phoneNumberController: TextEditingController(),
      genderController: TextEditingController(),
    );
    initControllers();
  }

  void initControllers() {
    final user = _viewModel.state.originUser;
    controllers.firstNameController.text = user.fullName.split(' ').first;
    controllers.lastNameController.text = user.fullName.split(' ').last;
    controllers.phoneNumberController.text = user.phoneNumber;
    controllers.emailController.text = user.email;
    controllers.genderController.text = user.gender;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.editProfile),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: RefreshIndicator(
                  onRefresh: () {
                    _viewModel.doIntent(const GetUserProfileIntent());
                    return Future.delayed(const Duration(seconds: 1));
                  },
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      const EditProfileHeader(),
                      const SizedBox(height: 16),
                      EditProfileFormSection(
                        formKey: formKey,
                        controllers: controllers,
                      ),
                      const SizedBox(height: 22),
                      BlocBuilder<EditProfileViewModel, EditProfileState>(
                        buildWhen: (previous, current) {
                          return previous.userInfoChanged !=
                                  current.userInfoChanged ||
                              previous.editUserProfileResult !=
                                  current.editUserProfileResult;
                        },
                        builder: (BuildContext context, state) {
                          return FilledButton(
                            onPressed:
                                !state.userInfoChanged ||
                                    state.editUserProfileResult is Loading
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      _viewModel.doIntent(
                                        const EditUserInfoIntent(),
                                      );
                                    }
                                  },
                            child: state.editUserProfileResult is Loading
                                ? const AppLoadingWidget(dimension: 20)
                                : Text(appLocalizations.update),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocSelector<
              EditProfileViewModel,
              EditProfileState,
              UiResult<UserEntity>
            >(
              selector: (state) => state.userProfileResult,
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: switch (state) {
                    Loading() => const AppLoadingOverlayWidget(),
                    _ => const SizedBox.shrink(),
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controllers.dispose();
    super.dispose();
  }
}

class EditProfileControllers {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController genderController;

  EditProfileControllers({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.genderController,
  });

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
  }
}
