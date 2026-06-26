import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/auth_providers/user_provider.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/error/failures/app_failures.dart';
import '../../../../../core/layers/localization/enums/languages_enum.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/utils/dialogs/app_dialogs.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../../core/presentation/widgets/app_loading_overlay_widget.dart';
import 'sections/profile_header_section.dart';
import 'skeletonizer/profile_page_skeletonizer_fake_dat.dart';
import 'view_model/profile_intent.dart';
import 'view_model/profile_state.dart';
import 'view_model/profile_view_model.dart';
import 'widgets/arrowed_profile_item_widget.dart';
import 'widgets/choose_notification_device_to_replace_widget.dart';
import 'widgets/toggled_profile_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseStatefulWidgetState<ProfilePage>
    with EffectsHandlingMixin {
  final ProfileViewModel _viewModel = getIt.get();
  final fakeUser = ProfilePageSkeletonizerFakeDat().fakeUser;

  @override
  void initState() {
    super.initState();
    _viewModel.effectStream.listen((event) {
      switch (event) {
        case DisplayErrorEffect():
          if (event.failure is ExceededTwoEnabledNotificationDevicesFailure) {
            if (!mounted) return;
            showDialog<void>(
              context: context,
              builder: (context) {
                return ChooseNotificationDeviceToReplaceWidget(
                  devices:
                      (event.failure
                              as ExceededTwoEnabledNotificationDevicesFailure)
                          .notificationDevices,
                  onDeviceSelected: (device) {
                    _viewModel.doIntent(
                      EnableNotificationsIntent(
                        replaceDeviceId: device.deviceId,
                      ),
                    );
                  },
                );
              },
            );
          } else {
            handleEffects(event);
          }
        default:
          handleEffects(event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.profile),
          centerTitle: true,
        ),
        body:
            BlocSelector<ProfileViewModel, ProfileState, UiResult<UserEntity>>(
              selector: (state) => state.userProfileResult,
              builder: (context, result) {
                switch (result) {
                  case Initial<UserEntity>():
                  case Loading<UserEntity>():
                    return Skeletonizer(
                      child: _ProfilePageLayout(user: fakeUser),
                    );
                  case Success<UserEntity>():
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        RefreshIndicator(
                          onRefresh: () async {
                            _viewModel.doIntent(const GetUserProfileIntent());
                            return Future.delayed(const Duration(seconds: 1));
                          },
                          child: _ProfilePageLayout(user: result.data),
                        ),

                        BlocBuilder<ProfileViewModel, ProfileState>(
                          buildWhen: (previous, current) {
                            return previous.logoutResult !=
                                    current.logoutResult ||
                                previous.deleteAccountResult !=
                                    current.deleteAccountResult ||
                                previous.enableNotificationsResult !=
                                    current.enableNotificationsResult ||
                                previous.disableNotificationsResult !=
                                    current.disableNotificationsResult;
                          },
                          builder: (context, state) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child:
                                  state.logoutResult is Loading ||
                                      state.deleteAccountResult is Loading ||
                                      state.enableNotificationsResult
                                          is Loading ||
                                      state.disableNotificationsResult
                                          is Loading
                                  ? const AppLoadingOverlayWidget()
                                  : const SizedBox.shrink(),
                            );
                          },
                        ),
                      ],
                    );
                  case Error<UserEntity>():
                    return AppErrorWidget(failure: result.failure);
                }
              },
            ),
      ),
    );
  }
}

class _ProfilePageLayout extends BaseStatelessWidget {
  final UserEntity user;

  const _ProfilePageLayout({required this.user});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    final viewModel = context.read<ProfileViewModel>();
    return ListView(
      children: [
        ProfileHeaderSection(
          imageUrl: user.profilePicture,
          title: user.fullName,
          confirmedAt: user.confirmedAt,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text(
            d.appLocalizations.account,
            style: d.typography.title.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ArrowedProfileItemWidget(
          title: d.appLocalizations.email,
          subTitle: user.email,
          onTap: () {
            Navigator.pushNamed(context, DefinedRoutes.editProfileRoute);
          },
        ),
        ArrowedProfileItemWidget(
          title: d.appLocalizations.password,
          subTitle: '**********',
          onTap: () {
            Navigator.pushNamed(context, DefinedRoutes.changePasswordRoute);
          },
        ),
        ArrowedProfileItemWidget(
          title: d.appLocalizations.logout,
          onTap: () {
            AppDialogs.areYouSureDialog(
              context,
              content: 'Are you sure you want to logout?',
              yesButtonAction: () {
                viewModel.doIntent(const LogoutIntent());
              },
            );
          },
        ),
        ArrowedProfileItemWidget(
          title: d.appLocalizations.deleteAccount,
          titleColor: AppColors.red,
          onTap: () {
            AppDialogs.areYouSureDialog(
              context,
              content: 'Are you sure you want to delete your account?',
              yesButtonAction: () {
                viewModel.doIntent(const DeleteAccountIntent());
              },
            );
          },
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text(
            d.appLocalizations.settings,
            style: d.typography.title.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ToggledProfileItemWidget(
          title: d.appLocalizations.language,
          subTitle: d.localizationManager.currentLocale.getLanguageName(),
          toggleOn: d.localizationManager.isEnglish,
          onTap: (value) {
            d.localizationManager.changeLocal(
              value ? LanguagesEnum.en : LanguagesEnum.ar,
            );
          },
        ),
        BlocBuilder<ProfileViewModel, ProfileState>(
          buildWhen: (previous, current) {
            return previous.enableNotificationsResult !=
                    current.enableNotificationsResult ||
                previous.disableNotificationsResult !=
                    current.disableNotificationsResult;
          },
          builder: (context, state) {
            return ToggledProfileItemWidget(
              title: d.appLocalizations.notifications,
              toggleOn: getIt.get<UserProvider>().notificationsEnabled,
              onTap: (value) {
                if (value) {
                  viewModel.doIntent(const EnableNotificationsIntent());
                } else {
                  viewModel.doIntent(const DisableNotificationsIntent());
                }
              },
            );
          },
        ),
        ToggledProfileItemWidget(
          title: d.appLocalizations.darkMode,
          toggleOn: d.themeManager.isDarkTheme,
          onTap: (value) {
            d.themeManager.changeTheme(
              value ? Brightness.dark : Brightness.light,
            );
          },
        ),
        ArrowedProfileItemWidget(
          title: d.appLocalizations.privacy,
          onTap: () {},
        ),
        ArrowedProfileItemWidget(title: d.appLocalizations.about, onTap: () {}),
      ],
    );
  }
}
