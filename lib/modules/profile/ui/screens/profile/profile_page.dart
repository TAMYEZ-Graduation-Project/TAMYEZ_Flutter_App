import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/layers/localization/enums/languages_enum.dart';
import '../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../core/presentation/bases/base_stateful_widget_state.dart';
import '../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../core/presentation/mixins/effects_handling_mixin.dart';
import '../../../../../core/presentation/result/ui_result.dart';
import '../../../../../core/presentation/routing/defined_routes.dart';
import '../../../../../core/presentation/widgets/app_error_widget.dart';
import 'sections/profile_header_section.dart';
import 'view_model/profile_state.dart';
import 'view_model/profile_view_model.dart';
import 'widgets/arrowed_profile_item_widget.dart';
import 'widgets/toggled_profile_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseStatefulWidgetState<ProfilePage>
    with EffectsHandlingMixin {
  final ProfileViewModel _viewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    _viewModel.effectStream.listen(handleEffects);
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
                    return _ProfilePageLayout(user: result.data);
                  case Error<UserEntity>():
                    return AppErrorWidget(failure: result.failure);
                }
              },
            ),
      ),
    );
  }

  final fakeUser = UserEntity(
    id: '1',
    email: 'use1@gmail.com',
    fullName: 'User One',
    assessmentStatus: CareerAssessmentStatusEnum.completed,
    careerPath: CareerPathEntity(
      id: '1',
      selectedAt: DateTime.now().toString(),
    ),
    createdAt: DateTime.now().toString(),
    updatedAt: DateTime.now().toString(),
    confirmedAt: DateTime.now().toString(),
  );
}

class _ProfilePageLayout extends BaseStatelessWidget {
  final UserEntity user;

  const _ProfilePageLayout({required this.user});

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
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
          onTap: () {},
        ),
        ArrowedProfileItemWidget(
          title: d.appLocalizations.deleteAccount,
          titleColor: AppColors.red,
          onTap: () {},
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
              value ? LanguagesEnum.ar : LanguagesEnum.en,
            );
          },
        ),
        ToggledProfileItemWidget(title: d.appLocalizations.notifications),
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
