import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final userDataUrl = 'http://localhost:8000/api/user';
final headshot = 'https://i.imgur.com/Rzwyxq5.png';

class Index extends StatefulWidget {
  @override
  IndexState createState() => IndexState();
}

class IndexState extends State<Index> {
  String fullName = "...";

  @override
  void initState() {
    super.initState();
    print("Index Screen");
    userRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Container(
                child: Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(headshot))),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[Text("Hello 👋"), Text("$fullName")],
            ))
      ],
    ))));
  }

  void userRequest() async {
    try {
      var storage = FlutterSecureStorage();
      var token = await storage.read(key: "token");
      Response response = await Dio().get(userDataUrl,
          options: Options(headers: {HttpHeaders.authorizationHeader: token}));
      var user = response.data['user'];
      setState(() {
        fullName = user['fullname'];
      });
    } on DioError catch (e) {
      if (e.response != null) {
        var message = e.response.data["message"];
        displayErrorDialog(message: message);
      } else {
        var message = e.response.data["message"];
        displayErrorDialog(message: message);
      }
    }
  }

  void displayErrorDialog({String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text("Login Again"),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, "login"),
                )
              ],
            ));
  }
}
