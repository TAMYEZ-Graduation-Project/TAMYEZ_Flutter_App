sealed class AppException implements Exception {
  final String? message;

  const AppException({this.message});
}

class ServerException extends AppException {
  final int? statusCode;

  ServerException({this.statusCode, super.message});
}

class NetworkException extends AppException {
  const NetworkException({super.message});
}

class CacheException extends AppException {
  const CacheException({super.message});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({super.message});
}

class LoginBadResponseException extends AppException {
  const LoginBadResponseException({super.message});
}

class QuizBadResponseException extends AppException {
  const QuizBadResponseException({super.message});
}

class CheckCareerAssessmentAnswersBadResponseException extends AppException {
  const CheckCareerAssessmentAnswersBadResponseException({super.message});
}

class UserProfileBadResponseException extends AppException {
  const UserProfileBadResponseException({super.message});
}

class UnableToGetFcmTokenException extends AppException {
  const UnableToGetFcmTokenException({super.message});
}

class ExceededTwoEnabledNotificationDevicesException extends AppException {
  const ExceededTwoEnabledNotificationDevicesException({super.message});
}

class GoogleLoginException extends AppException {
  const GoogleLoginException({super.message});
}

sealed class PlatformException extends AppException {
  const PlatformException({super.message});
}

class GoogleLoginNotSupportedException extends PlatformException {
  const GoogleLoginNotSupportedException({super.message});
}
