// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenResponse _$LoginTokenResponseFromJson(Map<String, dynamic> json) =>
    LoginTokenResponse(
      token: json['token'] as String?,
      expiration: json['expiration'] as String?,
    );

Map<String, dynamic> _$LoginTokenResponseToJson(LoginTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration,
    };
