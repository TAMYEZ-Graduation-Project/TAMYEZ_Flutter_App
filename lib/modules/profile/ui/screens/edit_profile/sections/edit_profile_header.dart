import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_keys.dart';
import '../../../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/widgets/app_loading_widget.dart';
import '../../../../../../core/presentation/widgets/network_image_caching_widget.dart';
import '../view_model/edit_profile_intent.dart';
import '../view_model/edit_profile_state.dart';
import '../view_model/edit_profile_view_model.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          context.read<EditProfileViewModel>().doIntent(
            const UploadProfilePictureIntent(),
          );
        },
        child: Stack(
          alignment: AlignmentGeometry.topRight,
          clipBehavior: Clip.none,
          children: [
            BlocBuilder<EditProfileViewModel, EditProfileState>(
              buildWhen: (previous, current) {
                return previous.uploadProfilePictureResult !=
                    current.uploadProfilePictureResult;
              },
              builder: (context, state) {
                final uploadProfilePictureResult =
                    state.uploadProfilePictureResult;
                switch (uploadProfilePictureResult) {
                  case Loading<void>():
                    return CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(state.tempImage!),
                      child: const AppLoadingWidget(),
                    );
                  default:
                    return Hero(
                      tag: AppKeys.profileImageHeroTag,
                      child: NetworkImageCachingWidget(
                        imageUrl: state.originUser.profilePicture,
                        placeholder: (context, url) => CircleAvatar(
                          radius: 70,
                          backgroundColor: AppColors.middleBlue,
                          child: const AppLoadingWidget(),
                        ),
                        imageBuilder: (context, imageProvider) {
                          return CircleAvatar(
                            radius: 70,
                            backgroundImage: imageProvider,
                            backgroundColor: Colors.transparent,
                          );
                        },
                        errorBuilder: (context, object, stackTrace) {
                          return CircleAvatar(
                            radius: 70,
                            backgroundColor: AppColors.darkGray,
                            child: const Center(
                              child: Icon(Icons.person, size: 70),
                            ),
                          );
                        },
                      ),
                    );
                }
              },
            ),
            const Positioned(
              top: 36,
              right: -12,
              child: Icon(Icons.camera_alt_outlined, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
