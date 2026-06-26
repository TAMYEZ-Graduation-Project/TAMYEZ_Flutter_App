import '../../entities/notification_device_entity.dart';

sealed class Failure {
  const Failure();
}

// ============= General ==============
class GoogleLoginFailure extends Failure {
  const GoogleLoginFailure();
}

class LoginBadResponseFailure extends Failure {
  const LoginBadResponseFailure();
}

class QuizBadResponseFailure extends Failure {
  const QuizBadResponseFailure();
}

class CheckCareerAssessmentAnswersBadResponseFailure extends Failure {
  const CheckCareerAssessmentAnswersBadResponseFailure();
}

class NotAllQuizQuestionsAnsweredFailure extends Failure {
  const NotAllQuizQuestionsAnsweredFailure();
}

class UserProfileBadResponseFailure extends Failure {
  const UserProfileBadResponseFailure();
}

class ImagePickerFailure extends Failure {
  const ImagePickerFailure();
}

class VersionConflictFailure extends Failure {
  const VersionConflictFailure();
}

class UnableToGetFcmTokenFailure extends Failure {
  const UnableToGetFcmTokenFailure();
}

class ExceededTwoEnabledNotificationDevicesFailure extends Failure {
  final List<NotificationDeviceEntity> notificationDevices;

  const ExceededTwoEnabledNotificationDevicesFailure(this.notificationDevices);
}

// =================================
sealed class NetworkFailure extends Failure {
  const NetworkFailure();
}

class NoInternetFailure extends NetworkFailure {
  const NoInternetFailure();
}

class ConnectionTimeoutFailure extends NetworkFailure {
  const ConnectionTimeoutFailure();
}

class SendTimeoutFailure extends NetworkFailure {
  const SendTimeoutFailure();
}

class ReceiveTimeoutFailure extends NetworkFailure {
  const ReceiveTimeoutFailure();
}

class BadCertificateFailure extends NetworkFailure {
  const BadCertificateFailure();
}

class RequestCancelledFailure extends NetworkFailure {
  const RequestCancelledFailure();
}

// =================================
class ServerFailure extends Failure {
  final int? statusCode;
  final String? serverMessage;

  const ServerFailure({this.statusCode, this.serverMessage});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(); // 400 / invalid format
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(); // 401
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class ParsingFailure extends Failure {
  const ParsingFailure(); // FormatException
}

class UnknownFailure extends Failure {
  const UnknownFailure();
}

// =========================
sealed class PlatformFailure extends Failure {
  const PlatformFailure();
}

class GoogleLoginNotSupportedFailure extends PlatformFailure {
  const GoogleLoginNotSupportedFailure();
}
