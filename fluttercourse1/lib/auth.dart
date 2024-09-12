import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse1/Screen/Login_screen.dart';

import 'Screen/home_screen.dart';
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //التغيرات هتحصل في firebase
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges() ,
          //اذا كان المستخدم عامل تسجيل دخول او لا
          builder: ((context,snapshot){
            if(snapshot.hasData){
              return HomeScreen();
            }
            else{
              return LoginScreen();
            }
          }
          )
      )

    ,);
  }
}
