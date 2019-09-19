import 'dart:io';
import 'package:dio/dio.dart';
import 'package:auth/network/constant/url.dart';

import 'package:auth/model/user.dart';
import 'package:flutter/widgets.dart';

Future<LoginResponse> loginRequest(Credential credential) async{
  try{
    Response res = await Dio().post(LoginUrl, data: credential.toJson());
    return LoginResponse.fromJson(res.data);
  }
  catch(e){
    print(e);
    throw e;
  }
}

Future<UserDataResponse> userDataRequest({@required String token}) async{
  try{
    Response res = await Dio().get( 
      DataUrl,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: token}));
    return UserDataResponse.fromJson(res.data);
  }
  catch(e){
    print(e);
    throw e;
  }
  
}
