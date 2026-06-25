import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/entities/user_entity.dart';

class ProfilePageSkeletonizerFakeDat {
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
