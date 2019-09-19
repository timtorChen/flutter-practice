import 'dart:io';

import 'package:auth/model/user.dart';
import 'package:auth/network/exception/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth/store/user.dart';
import 'package:provider/provider.dart';

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
      userLogin();
    }
  }

  void userLogin() async{
    try{
      var user = Provider.of<UserStore>(context);
      final credential = Credential(password: _password, username: _username);
      await user.login(credential);
      Navigator.pushNamed(context, "index");
    }
    on NetworkException catch(e){
      popupError(e.message);
    }
    on AuthException catch(e){
      popupError(e.message);
    }
  }
  
  void popupError(String errorMessage){
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(content: Text(errorMessage)));
  }
}
