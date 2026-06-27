import 'dart:async';
import 'dart:io' show File;

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../core/auth_providers/auth_provider.dart';
import '../../../../../../core/auth_providers/user_provider.dart';
import '../../../../../../core/entities/user_entity.dart';
import '../../../../../../core/execution/operation_result.dart';
import '../../../../../../core/presentation/bases/base_cubit.dart';
import '../../../../../../core/presentation/result/ui_effect.dart';
import '../../../../../../core/presentation/result/ui_result.dart';
import '../../../../../../core/presentation/utils/image_picker/image_picker_service.dart';
import '../../../../../../core/success/success_enum.dart';
import '../../../../domain/entities/edit_profile_params.dart';
import '../../../../domain/entities/upload_profile_picture_response_entity.dart';
import '../../../../domain/use_cases/edit_user_profile_use_case.dart';
import '../../../../domain/use_cases/get_user_profile_use_case.dart';
import '../../../../domain/use_cases/upload_profile_picture_use_case.dart';
import 'edit_profile_intent.dart';
import 'edit_profile_state.dart';

@injectable
class EditProfileViewModel extends BaseCubit<EditProfileState, UiEffect> {
  final EditUserProfileUseCase _editProfileUseCase;
  final UploadProfilePictureUseCase _uploadProfilePictureUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final AuthProvider _authProvider;
  final UserProvider _userProvider;
  final ImagePickerService _imagePickerService;

  EditProfileViewModel(
    this._imagePickerService,
    this._editProfileUseCase,
    this._uploadProfilePictureUseCase,
    this._getUserProfileUseCase,
    this._authProvider,
    this._userProvider,
  ) : super(const EditProfileState()) {
    _initDebounce();
    _initUser();
  }

  Future<void> doIntent(EditProfileIntent intent) async {
    switch (intent) {
      case EditUserInfoIntent():
        await _editUserInfo();
      case UploadProfilePictureIntent():
        await uploadProfilePicture();
      case OnFieldsChangeIntent():
        _onFieldsChangeSubject.add(intent);
        break;
      case GetUserProfileIntent():
        await _getUserProfile();
    }
  }

  void _initUser() {
    emit(
      state.copyWith(
        originUser: _userProvider.user!,
        editedUser: _userProvider.user!,
      ),
    );
  }

  Future<void> _editUserInfo() async {
    if (!state.userInfoChanged) return;
    emit(state.copyWith(editUserProfileResult: const Loading()));
    final result = await _editProfileUseCase.call(
      params: _getEditUserProfileParams(),
      saveLocally: _authProvider.isUserRemembered,
    );

    switch (result) {
      case OperationSuccess<void>():
        emit(
          state.copyWith(
            editUserProfileResult: const Success(null),
            originUser: state.editedUser.copyWith(v: state.originUser.v + 1),
            editedUser: state.editedUser.copyWith(v: state.originUser.v + 1),
            userInfoChanged: false,
          ),
        );
        _userProvider.setUser(user: state.originUser);
        emitEffect(
          const DisplaySuccessEffect(success: SuccessEnum.editProfileSuccess),
        );
      case OperationFailure<void>():
        emit(state.copyWith(editUserProfileResult: Error(result.failure)));
        emitEffect(DisplayErrorEffect(failure: result.failure));
    }
  }

  EditUserProfileParams _getEditUserProfileParams() {
    final newNames = state.editedUser.fullName.split(' ');
    return EditUserProfileParams(
      firstName: newNames.first,
      lastName: newNames.last,
      phoneNumber: state.editedUser.phoneNumber,
      gender: state.editedUser.gender,
      v: state.originUser.v,
    );
  }

  final _onFieldsChangeSubject = BehaviorSubject<OnFieldsChangeIntent>();
  StreamSubscription<OnFieldsChangeIntent>? _onFieldsChangeSubscription;

  void _initDebounce() {
    _onFieldsChangeSubscription = _onFieldsChangeSubject
        .debounceTime(const Duration(milliseconds: 300))
        .listen(_hasUserInfoChanged);
  }

  void _hasUserInfoChanged(OnFieldsChangeIntent intent) {
    final previousNames = state.editedUser.fullName.split(' ');
    final newFullName =
        '${intent.firstName ?? previousNames.first} ${intent.lastName ?? previousNames.last}';
    final originUser = state.originUser;
    final editedUser = state.editedUser.copyWith(
      fullName: newFullName,
      phoneNumber: intent.phoneNumber,
      gender: intent.gender,
    );
    if (originUser.fullName != editedUser.fullName ||
        originUser.phoneNumber != editedUser.phoneNumber ||
        originUser.gender != editedUser.gender ||
        originUser.phoneNumber != editedUser.phoneNumber) {
      emit(state.copyWith(editedUser: editedUser, userInfoChanged: true));
    } else {
      emit(state.copyWith(editedUser: editedUser, userInfoChanged: false));
    }
  }

  Future<void> uploadProfilePicture() async {
    final fileResult = await _imagePickerService.pickFromGallery();
    switch (fileResult) {
      case OperationSuccess<File?>():
        if (fileResult.data == null) return;
        emit(
          state.copyWith(
            uploadProfilePictureResult: const Loading(),
            tempImage: fileResult.data,
          ),
        );
        final result = await _uploadProfilePictureUseCase.call(
          image: fileResult.data!,
          version: state.originUser.v.toInt(),
        );

        switch (result) {
          case OperationSuccess<UploadProfilePictureBodyEntity>():
            emit(
              state.copyWith(
                uploadProfilePictureResult: const Success(null),
                originUser: state.originUser.copyWith(
                  profilePicture: result.data.url,
                  v: result.data.v,
                ),
                editedUser: state.editedUser.copyWith(
                  profilePicture: result.data.url,
                  v: result.data.v,
                ),
                clearTempImage: true,
              ),
            );
            _userProvider.setUser(user: state.originUser);
            emitEffect(
              const DisplaySuccessEffect(
                success: SuccessEnum.profilePictureUploadedSuccess,
              ),
            );
          case OperationFailure<UploadProfilePictureBodyEntity>():
            emit(
              state.copyWith(
                uploadProfilePictureResult: Error(result.failure),
                clearTempImage: true,
              ),
            );
            emitEffect(DisplayErrorEffect(failure: result.failure));
        }
      case OperationFailure<File?>():
        emit(
          state.copyWith(uploadProfilePictureResult: Error(fileResult.failure)),
        );
        emitEffect(DisplayErrorEffect(failure: fileResult.failure));
    }
  }

  Future<void> _getUserProfile() async {
    emit(state.copyWith(userProfileResult: const Loading()));
    final result = await _getUserProfileUseCase.call();

    switch (result) {
      case OperationSuccess<UserEntity>():
        _userProvider.setUser(user: result.data);
        emit(
          state.copyWith(
            userProfileResult: Success(result.data),
            userInfoChanged: false,
            originUser: result.data,
            editedUser: result.data,
          ),
        );
        emitEffect(const ReinitDataEffect());
      case OperationFailure<UserEntity>():
        emit(state.copyWith(userProfileResult: Error(result.failure)));
    }
  }

  @override
  Future<void> close() {
    _onFieldsChangeSubscription?.cancel();
    _onFieldsChangeSubject.close();
    return super.close();
  }
}
