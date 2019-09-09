import 'package:flutter/material.dart';
import 'package:auth/screen/login.dart';
import 'package:auth/screen/index.dart';
import 'package:auth/screen/entry.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      initialRoute: 'entry',
      routes: {
        'entry': (context)=> Entry(),
        'login': (context)=> Login(),
        'index': (context)=> Index()
      },
    );
  }
}

