import '../../../../core/network/models/career_dto.dart';
import '../../../../core/network/models/user_dto.dart';

class ChooseSuggestedCareerResponse {
  final bool? success;
  final String? message;
  final ChooseSuggestedCareerBody? body;

  ChooseSuggestedCareerResponse({this.success, this.message, this.body});

  factory ChooseSuggestedCareerResponse.fromJson(Map<String, dynamic> json) {
    return ChooseSuggestedCareerResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      body: json['body'] != null
          ? ChooseSuggestedCareerBody.fromJson(
              json['body'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'body': body?.toJson()};
  }
}

class ChooseSuggestedCareerBody {
  final UserDto? user;

  ChooseSuggestedCareerBody({this.user});

  factory ChooseSuggestedCareerBody.fromJson(Map<String, dynamic> json) {
    return ChooseSuggestedCareerBody(
      user: json['user'] != null
          ? UserDto.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': user?.toJson()};
  }
}

class CareerPath {
  final String? id;
  final DateTime? selectedAt;
  final CareerDto? career;

  CareerPath({this.id, this.selectedAt, this.career});

  factory CareerPath.fromJson(Map<String, dynamic> json) {
    return CareerPath(
      id: json['id']?.toString(),
      selectedAt: json['selectedAt'] != null
          ? DateTime.parse(json['selectedAt'] as String)
          : null,
      career: json['career'] != null
          ? CareerDto.fromJson(json['career'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'selectedAt': selectedAt?.toIso8601String(),
      'career': career?.toJson(),
    };
  }
}
