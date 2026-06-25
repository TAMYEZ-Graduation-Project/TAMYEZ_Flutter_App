class DeleteAccountRequest {
  final int version;

  DeleteAccountRequest({required this.version});

  factory DeleteAccountRequest.fromJson(Map<String, dynamic> json) {
    return DeleteAccountRequest(version: json['v'] as int);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['v'] = version;
    return data;
  }
}
