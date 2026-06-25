import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/error/exceptions/app_exceptions.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/mappers/base_auth_mapper.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/change_password_params.dart';
import '../../domain/entities/edit_profile_params.dart';
import '../../domain/entities/upload_profile_picture_response_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/local/profile_local_data_source.dart';
import '../data_sources/remote/profile_remote_data_source.dart';
import '../mapper/profile_mappers.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;

  const ProfileRepositoryImp(
    this._profileRemoteDataSource,
    this._profileLocalDataSource,
  );

  @override
  Future<OperationResult<UserEntity>> getUserProfile() {
    return repoResultHandler(() async {
      final response = await _profileRemoteDataSource.getUserProfile().timeout(
        const Duration(seconds: 5),
      );
      if (response.body?.user == null || response.body?.user?.id == null) {
        throw const UserProfileBadResponseException();
      }
      await _profileLocalDataSource.saveUserProfile(
        newUser: response.body!.user!,
      );
      return response.body!.user!.toEntity();
    });
  }

  @override
  Future<OperationResult<UserEntity>> syncUserProfile() async {
    final result = await getUserProfile();
    switch (result) {
      case OperationSuccess<UserEntity>():
        return result;
      case OperationFailure<UserEntity>():
        final savedUser = await _profileLocalDataSource.getSavedUserProfile();
        if (savedUser != null) {
          return OperationSuccess(
            savedUser.toEntity(),
            warning: result.failure,
          );
        }
        return OperationFailure(result.failure);
    }
  }

  @override
  Future<OperationResult<void>> editUserProfile({
    required EditUserProfileParams params,
    bool saveLocally = true,
  }) async {
    return repoResultHandler(() async {
      await _profileRemoteDataSource.editUserProfile(params.toRequest());
      if (saveLocally) {
        final user = await _profileLocalDataSource.getSavedUserProfile();
        if (user != null) {
          final userOldNames = (user.fullName ?? '').split(' ');

          await _profileLocalDataSource.saveUserProfile(
            newUser: user.copyWith(
              fullName:
                  '${params.firstName ?? userOldNames.first} ${params.lastName ?? userOldNames.last}',
              phoneNumber: params.phoneNumber,
              gender: params.gender,
              v: params.v + 1,
            ),
          );
        }
      }
    });
  }

  @override
  Future<OperationResult<UploadProfilePictureBodyEntity>> uploadProfilePicture({
    required File image,
    required int version,
    bool saveLocally = true,
  }) async {
    return repoResultHandler(() async {
      final response = await _profileRemoteDataSource.uploadProfilePicture(
        attachment: await MultipartFile.fromFile(image.path),
        version: version,
      );
      if (response.body == null || response.body?.url == null) {
        throw const UserProfileBadResponseException();
      }
      if (saveLocally) {
        final user = await _profileLocalDataSource.getSavedUserProfile();
        if (user != null) {
          await _profileLocalDataSource.saveUserProfile(
            newUser: user.copyWith(
              profilePicture: response.body!.url,
              v: version + 1,
            ),
          );
        }
      }
      return response.body!.toEntity();
    });
  }

  @override
  Future<OperationResult<void>> changePassword({
    required ChangePasswordParams params,
    required bool userRemembered,
  }) async {
    return repoResultHandler(() async {
      await _profileRemoteDataSource.changePassword(
        request: params.toRequest(),
      );

      if (userRemembered) {
        final user = await _profileLocalDataSource.getSavedUserProfile();
        if (user != null) {
          await _profileLocalDataSource.saveUserProfile(
            newUser: user.copyWith(v: params.v + 1),
          );
        }
      }
    });
  }
}
