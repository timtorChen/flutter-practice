import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

final loginUrl = "http://localhost:8000/api/user/login";


class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String _username;
  String _password;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print("Login Screen");

  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Container(
            alignment: Alignment.center,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: 250,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(labelText: 'username'),
                        validator: (value) =>
                            value.isEmpty ? 'Are you sure 🙄' : null,
                        onSaved: (value) => _username = value,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 20),
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'password'),
                        validator: (value) =>
                            value.isEmpty ? 'How about password 🤔' : null,
                        onSaved: (value) => _password = value,
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              onPressed: onFormSubmitted,
                              child: Text('LOGIN')))
                    ],
                  ),
                ))));
  }

  void onFormSubmitted() {
    FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      getHttp();
    }
  }

  void getHttp() async {
    try {
      Response response = await Dio().post(
          loginUrl,
          data: {"username": _username, "password": _password});
      // store the token in Secure Storage
      var token = response.data['token'];
      var storage = new FlutterSecureStorage();
      await storage.write(key: "token", value: token);

      Navigator.pushReplacementNamed(context, 'index');
    } on DioError catch (e) {
      // TODO: Change into model classes method for scalable project
      // Manual serializing with jsonDecode method is easy but it would lose all type check

      // Error check
      // Unable to send the request, because of internet access error
      if (e.response != null) {
        var message = e.response.data['message'];
        showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text(message)));
      } else {
        var message = "Unable to send request";
        showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text(message)));
      }
    }
  }
}
