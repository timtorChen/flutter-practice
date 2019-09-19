import 'package:auth/store/user.dart';
import 'package:flutter/material.dart';
import 'package:auth/screen/login.dart';
import 'package:auth/screen/index.dart';
import 'package:auth/screen/splash.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(builder: (c) => UserStore())],
        child: MaterialApp(
            title: 'Authentication Demo',
            initialRoute: 'splash',
            routes: {
              "splash": (context) => Splash(),
              "login": (context) => Login(),
              "index": (context) => Index()
            }));
  }
}
