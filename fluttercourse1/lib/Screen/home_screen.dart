import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // save data of user
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text ('Welcome , Your \re signed in ',
              style: TextStyle(
              fontSize: 25 ,
              ),
            ),
            Text (
              user!.email!,
              style: TextStyle(
                fontSize: 25 ,
              ),
            ),
            SizedBox(height: 10,),

            // to log out
            MaterialButton(
                onPressed:(){
                  FirebaseAuth.instance.signOut();
                },
              color: Colors.blue,
              child: Text('Sign out'),
            )
        ],
      ),
      ),

    );
  }
}
