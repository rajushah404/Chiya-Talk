import 'package:json_annotation/json_annotation.dart';

part 'login_token_response.g.dart';

@JsonSerializable()
class LoginTokenResponse {
  String? token;
  String? expiration;

  LoginTokenResponse({this.token, this.expiration});

  LoginTokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiration'] = expiration;
    return data;
  }
}
