// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenRequest _$LoginTokenRequestFromJson(Map<String, dynamic> json) =>
    LoginTokenRequest(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginTokenRequestToJson(LoginTokenRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
