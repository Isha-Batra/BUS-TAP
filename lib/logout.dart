import 'package:flutter/material.dart';
class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'login');
            },
            child: Text("LogOut"),),
          ),
        ],),

      ),
    );
  }
}
