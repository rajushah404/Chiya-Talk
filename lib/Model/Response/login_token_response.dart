class LoginTokenResponse {
  String? token;
  String? statusCode;
  String? message;

  LoginTokenResponse({this.token, this.statusCode, this.message});

  LoginTokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}
