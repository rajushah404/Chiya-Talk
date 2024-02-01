class MeassgeResponse {
  String? message;
  String? statusCode;

  MeassgeResponse({this.message, this.statusCode});

  MeassgeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    return data;
  }
}
