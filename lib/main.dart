import 'package:amplifylife/Screens/login_page.dart';
import 'package:amplifylife/Screens/signup_with_email.dart';
import 'package:amplifylife/Screens/signup_with_emailp2.dart';
import 'package:amplifylife/Screens/signup_with_page.dart';
import 'package:amplifylife/Screens/timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => const LoginPage(),
        '/second' : (context) =>const SignupWith(),
        '/third'  : (context) => EmailSignup(),
        '/fourth'  : (context) => EmailSignupPage2(),
        '/timer'  : (context) => CoundownTimer(),
      },
    );
  }
}