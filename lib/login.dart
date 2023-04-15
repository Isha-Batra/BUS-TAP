import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  TextEditingController inputcontroller_email=new TextEditingController();
  TextEditingController inputcontroller_pass=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('background/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 130,left: 35),
            child: Text("Welcome\nBack",style: TextStyle(fontSize: 33,color: Colors.white),),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,right: 35,left: 35,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                TextField(
                  controller: inputcontroller_email,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30 ,),
                TextField(
                  controller: inputcontroller_pass,
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text("Sign in",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff4c505b),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: ()async{
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: inputcontroller_email.text,
                              password:inputcontroller_pass.text
                          );
                          Navigator.pushNamed(context, 'logout');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,'Register');
                  },
                    child: Text("Sign up",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                            color: Color(0xff4c505b),
                            fontSize: 18,
                        ),
                  ),
                    style: ButtonStyle(),
                  ),

                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff4c505b),
                          fontSize: 18,
                        ),
                      )),
                ],)

              ],),
            ),
          ),
        ],),

      ),
    );
  }
}
