import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/model/counter.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    var counter = Provider.of<CounterModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text('first page')),
        body: Center(
          child: Text('Counter ${counter.value}')
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, '/increment'),
          child: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
