import 'package:json_annotation/json_annotation.dart';

part 'login_token_request.g.dart';

@JsonSerializable()
class LoginTokenRequest {
  String? username;
  String? password;

  LoginTokenRequest({this.username, this.password});

  LoginTokenRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
