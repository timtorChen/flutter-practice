import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Entry extends StatefulWidget {
  @override
  EntryState createState() => EntryState();
}

class EntryState extends State<Entry> {
  @override
  void initState() {
    super.initState();
    print("Entry Screen");
    checkToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
    ));
  }

  void checkToken() async {
    final storage = FlutterSecureStorage();
    //  check if there is token or not
    String token = await storage.read(key: "token");
    token != null
        ? Navigator.pushReplacementNamed(context, "index")
        : Navigator.pushReplacementNamed(context, "login");
  }
}
