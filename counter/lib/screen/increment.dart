import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/model/counter.dart';

class Increment extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    var counter = Provider.of<CounterModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text('second page')),
        body: Center(
          child: Text('Counter ${counter.value}')
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> counter.increment(),
          child: Icon(Icons.add),
      ),
    );
  }
}
