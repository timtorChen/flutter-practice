import 'package:counter/model/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/screen/app.dart';
import 'package:counter/screen/increment.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context)=> CounterModel())
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
           '/': (context)=> App(),
           '/increment': (context)=> Increment()
          },
        ),
    );
  }
}
