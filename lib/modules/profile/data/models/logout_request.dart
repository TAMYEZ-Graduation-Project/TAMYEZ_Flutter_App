class LogoutRequest {
  final String flag;
  final String? deviceId;

  LogoutRequest({this.flag = 'One', this.deviceId});

  factory LogoutRequest.fromJson(Map<String, dynamic> json) {
    return LogoutRequest(
      flag: json['flag'] as String? ?? 'One',
      deviceId: json['deviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    data['deviceId'] = deviceId;
    return data;
  }
}
