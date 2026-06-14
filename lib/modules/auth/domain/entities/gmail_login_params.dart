import 'package:equatable/equatable.dart';

class GmailLoginParams extends Equatable {
  const GmailLoginParams({this.deviceId, this.fcmToken, required this.idToken});

  final String? deviceId;
  final String? fcmToken;
  final String idToken;

  @override
  List<Object?> get props => [deviceId, fcmToken, idToken];
}
