import 'package:json_annotation/json_annotation.dart';

// This allows User class to access private method in generated file
part 'user.g.dart';


@JsonSerializable()
class Credential {
  final String username;
  final String password;

  Credential({this.username, this.password});

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);

  Map<String,dynamic> toJson()=> _$CredentialToJson(this);
}


@JsonSerializable()
class UserDataResponse{
  final String username;
  final String fullname;
  final int height;
  final int wieght;

  UserDataResponse({
    this.username,
    this.fullname,
    this.height,
    this.wieght,
  });

  /// Using factory constructor for 
  //  creating a new Data instance from a Map.
  factory UserDataResponse.fromJson(Map<String, dynamic> json) => _$UserDataResponseFromJson(json);
  //  Transform a Data instance to a Map
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}


@JsonSerializable()
class LoginResponse {
  final bool success;
  final String token;
  LoginResponse({this.success, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class ErrorResponse {
  final bool success;
  final String message;
  ErrorResponse({this.success, this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
