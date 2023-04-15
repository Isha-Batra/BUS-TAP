import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab/login.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
import 'package:lab/logout.dart';
import 'package:lab/register.dart';
import 'package:lab/flashscreen.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
  home:Flash_screen(),
    routes: {
    'login':(context)=>Mylogin(),
      'Register':(context)=>Myregister(),
      'logout':(context)=>Logout(),
    },
  ));
}



