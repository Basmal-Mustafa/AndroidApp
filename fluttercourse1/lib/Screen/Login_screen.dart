import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse1/Screen/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email_control = TextEditingController();
  final password_control = TextEditingController();

  Future login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_control.text.trim(),
        password: password_control.text.trim(),
    );
  }
  void openSignupScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SignupScreen()), // Correctly create a route
    );
  }


  //لتعطيل  لو مش بستخدمهم controles
  @override
  void dispose() {
    super.dispose();
    email_control.dispose();
    password_control.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],

      //safearea عشان ابعدهم من الحواف
      body: SafeArea(
        child : Center(

          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


              //Iamge
                  Image.asset('images/imglogin.png',
                height: 250,)
              ,
              SizedBox(height: 20,),
              //Title
              Text('Login' , style: GoogleFonts.robotoCondensed(
                fontSize: 40, fontWeight: FontWeight.bold,
                color: Colors.blue
              ),),
            //SubTitel
              Text('Welcome back ! NIce to see you agin : -)',
              style: GoogleFonts.robotoCondensed(fontSize: 18 ),
              ),
              SizedBox(height: 50,),

              //Email Textfield
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                      padding: const  EdgeInsets.symmetric(horizontal: 20),
                    child:TextField(
                      controller: email_control,
                      decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email'
                      ),
                    )
                    ,
                  ),
                ),
              ),
              SizedBox(height: 10,),

              //Passwors Textfeild

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 20),
                    child:TextField(
                      controller: password_control,
                      //password بيكون مخفي
                      obscureText: true,
                      decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password'
                      ),
                    )
                    ,
                  ),
                ),
              ),

              SizedBox(height: 15,),
              //button login
              Padding(
                padding: const EdgeInsets.symmetric
                  (horizontal: 20),
                  child : GestureDetector(
                    onTap:  login,

                    child:Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text('login',
                          style:GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),),
                      ),



                  ) ,
                  ),

              ),
              SizedBox(height: 25,)
              ,

              //Text login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('forgotpasssword?',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontWeight:  FontWeight.bold,
                ))
                  ,
                  GestureDetector(
                    onTap:openSignupScreen,

                 child:  Text('Sign Up',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.blue,
                    fontWeight:  FontWeight.bold,

                  ),)
                    ,
                  )
              ,]

          ),
              



            ],
          )
          ),

        ),
      )

    );
  }
}
