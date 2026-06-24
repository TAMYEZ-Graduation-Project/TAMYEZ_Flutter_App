import '../../../../core/network/models/quiz_dto.dart';

class SavedQuizzesResponseDto {
  final bool? success;
  final String? message;
  final SavedQuizzesBodyDto? body;

  SavedQuizzesResponseDto({this.success, this.message, this.body});

  factory SavedQuizzesResponseDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizzesResponseDto(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      body: json['body'] != null
          ? SavedQuizzesBodyDto.fromJson(json['body'] as Map<String, dynamic>)
          : null,
    );
  }
}

class SavedQuizzesBodyDto {
  final SavedQuizzesPaginationDto? savedQuizzes;

  SavedQuizzesBodyDto({this.savedQuizzes});

  factory SavedQuizzesBodyDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizzesBodyDto(
      savedQuizzes: json['savedQuizzes'] != null
          ? SavedQuizzesPaginationDto.fromJson(
              json['savedQuizzes'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class SavedQuizzesPaginationDto {
  final int? totalCount;
  final int? totalPages;
  final int? currentPage;
  final int? size;
  final List<SavedQuizDto>? data;

  SavedQuizzesPaginationDto({
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.size,
    this.data,
  });

  factory SavedQuizzesPaginationDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizzesPaginationDto(
      totalCount: json['totalCount'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      size: json['size'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SavedQuizDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SavedQuizDto {
  final String? id;
  final QuizDto? quizId;
  final String? score;
  final String? takenAt;

  SavedQuizDto({this.id, this.quizId, this.score, this.takenAt});

  factory SavedQuizDto.fromJson(Map<String, dynamic> json) {
    return SavedQuizDto(
      id: json['id'] as String?,
      quizId: json['quizId'] != null
          ? QuizDto.fromJson(json['quizId'] as Map<String, dynamic>)
          : null,
      score: json['score'] as String?,
      takenAt: json['takenAt'] as String?,
    );
  }
}
