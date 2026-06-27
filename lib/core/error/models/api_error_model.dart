class ApiErrorModel {
  ApiErrorModel({this.success, this.error});

  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    error = json['error'] != null
        ? Error.fromJson(json['error'] as Map<String, dynamic>)
        : null;
  }

  bool? success;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (error != null) {
      map['error'] = error?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'ApiErrorModel(success: $success, error: $error)';
  }
}

class Error {
  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'] is num ? '$code' : json['code'] as String?;
    message = json['message'] as String?;
  }

  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    return map;
  }

  @override
  String toString() {
    return 'Error(code: $code, message: $message)';
  }
}
