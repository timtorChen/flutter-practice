import 'package:auth/store/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


final headshot = 'https://i.imgur.com/Rzwyxq5.png';

class Index extends StatefulWidget {

  @override
  IndexState createState() => IndexState();
}

class IndexState extends State<Index> {
  
  UserStore user;

  @override
  void initState() {
    super.initState();
    print("Index Screen");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
      // TODO: Track the latest update of life-cycle related issue
    /* 
      I like to run a initialization function on index page. Intuitively, I would put _initUserStore in initState().
      However, you will get ` Unhandled Exception: inheritFromWidgetOfExactType(InheritedProvider<UserStore>) or inheritFromElement() was called before IndexState.initState() completed.`
      I think this error can be just a caution.
      In the point of view of ReactJs class component lifecycle.
      didChangeDependencies in Flutter looks like ComponentDidUpdate in ReactJs, which called after component re-renderd.
      but there is a lack of similar design in Flutter, like ComponentDidMount in ReactJs, which called once after component is rendered on DOM.

      The only solution I found is in the discussion
      https://github.com/rrousselGit/provider/issues/141
      https://github.com/flutter/flutter/issues/34130
      https://juejin.im/post/5d00a84fe51d455a2f22023f
      in prevent of looply calling initialization function
      You should add a checker to comfirm this function only run one time.
    */ 
    _initUserStore();
  }

  void _initUserStore() async{
    if( this.user == null){
      this.user = Provider.of<UserStore>(context);
      // TODO: Error handeling
      await this.user.getData();
    }
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
              children: <Widget>[Text("Hello 👋"), Text("${this.user.data.fullname}")],
            ))
      ],
    ))));
  }
}