import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Myregister extends StatefulWidget {
  const Myregister({Key? key}) : super(key: key);

  @override
  State<Myregister> createState() => _MyregisterState();
}

class _MyregisterState extends State<Myregister> {
  TextEditingController inputcontroller_email=new TextEditingController();
  TextEditingController inputcontroller_pass=new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('background/register.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 130,left: 35,),
              child: Text("Create\nAccount",style: TextStyle(fontSize: 33,color: Colors.white,),),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,left: 35,right: 35,),
                child: Column(children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.white,),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: inputcontroller_email,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white,),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: inputcontroller_pass,


                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white,),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                  ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text("Sign Up",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color: Colors.white,),),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: ()async{
                          try {
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: inputcontroller_email.text,
                              password:inputcontroller_pass.text
                            );
                            Navigator.pushNamed(context, 'logout');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],),
                  SizedBox(height: 40,),
                  Row(children: <Widget>[
                    TextButton(onPressed: (){
                        Navigator.pushNamed(context, 'login');
                    }, child: Text("Sign In",style: TextStyle(decoration:TextDecoration.underline,fontSize: 18,color: Colors.white),
                    ),
                    style: ButtonStyle(),),
                  ],)
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
