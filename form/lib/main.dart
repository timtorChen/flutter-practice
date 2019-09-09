import 'package:flutter/material.dart';

// Entry point
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoooo',
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(title: Text('Form example app')),
        body: MyCustomForm(),

      )
    );
  }
}

class MyCustomForm extends StatefulWidget{
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm>{


  final _formKey = GlobalKey<FormState>();
  final textContoller = TextEditingController();


  @override
  void initState(){
    super.initState();
    textContoller.addListener(()=> print("${textContoller.text}"));
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textContoller.dispose();
  }


  @override
  Widget build(BuildContext context){
    // context is a BuildContext instance 
    // which gets passed to the builder of a widget 
    // in order to let it know where it is inside the Widget Tree of your app.
    return Scaffold(
      body: Form(
          key:_formKey, 
          child:Column(
            // Layout property: align children from start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(  
                controller: textContoller,
                validator: (value)=> value.isEmpty ? 'Please Enter some text fuck u' : null
              ),
              Padding(
                // Layout propery: top:16, bottom:16  
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('ayaya'),));
                    }
                  },
                  child: Text('submit'),
                )
              ),
            ],
        )),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>
          showDialog(
            context: context,
            builder: (context)=> 
              AlertDialog(content: Text(textContoller.text))
          ),
        tooltip: 'show input value',
        child: Icon(Icons.textsms),
      )
    );
    
  }
}