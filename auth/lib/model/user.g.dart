// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return Credential(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) {
  return UserDataResponse(
    username: json['username'] as String,
    fullname: json['fullname'] as String,
    height: json['height'] as int,
    wieght: json['wieght'] as int,
  );
}

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'fullname': instance.fullname,
      'height': instance.height,
      'wieght': instance.wieght,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    success: json['success'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    success: json['success'] as bool,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
