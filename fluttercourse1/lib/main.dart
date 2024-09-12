import 'package:flutter/material.dart';
import 'package:fluttercourse1/Screen/Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttercourse1/Screen/home_screen.dart';
import 'package:fluttercourse1/Screen/signup_screen.dart';
import 'package:fluttercourse1/auth.dart';


void main() async {
  //to access to connect this code by firebase
  //من خلال السطرين دول بربط فايربيس بالكود
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove the debug bunner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const Auth(),
      routes: {
        '/': (context)=> const Auth(),
        'homeScreen' :(context)=> const HomeScreen(),
        'signupScreen': (context) => const SignupScreen(),
        'loginScreen':(context) => const LoginScreen(),
      },

    );
  }
  }




