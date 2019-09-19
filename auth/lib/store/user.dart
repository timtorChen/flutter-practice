import 'package:auth/network/exception/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:auth/model/user.dart';
import 'package:auth/network/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserStore extends ChangeNotifier {

  final _storage = FlutterSecureStorage();
  var data = UserDataResponse(
    username: '...',
    fullname: '...',
    height: 0,
    wieght: 0
  );

  Future<void> login(Credential credential) async{
    try{
      print("Request: login");
      final data = await loginRequest(credential);
      // Create a storage instance to security-related data
      // TODO: make a class for tackling token read and write
      _storage.write(key: "token", value: data.token);
    }
    on DioError catch(e){
      if(e.response==null){
        throw NetworkException(
          message: "Cannot access backend"); 
      }else{
        throw AuthException(
          message: "Wrong username or password", 
          statusCode: e.response.statusCode);
      }
    }
  }

  Future<void> getData() async{
    try{
      String token = await _storage.read(key: "token");
      print("Request: user data");
      this.data = await userDataRequest(token: token);
      notifyListeners();
    }
    on DioError catch(e){
      throw e;     
    }
  }
    
}
