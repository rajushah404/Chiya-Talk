import 'package:json_annotation/json_annotation.dart';

part 'login_token_response.g.dart';

@JsonSerializable()
class LoginTokenResponse {
  String? token;
  String? message;

  LoginTokenResponse({this.token});

  LoginTokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['Message'] = message;
    return data;
  }
}
