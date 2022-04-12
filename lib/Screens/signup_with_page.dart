import 'package:amplifylife/widgets/cw_back_icon.dart';
import 'package:amplifylife/widgets/cw_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupWith extends StatefulWidget {
  const SignupWith({Key? key}) : super(key: key);

  @override
  State<SignupWith> createState() => _SignupWithState();
}

class _SignupWithState extends State<SignupWith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const BackIcon(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    "assets/images/amplify logo.png",
                    height: 70,
                  ),
                  const SizedBox(height: 20),
                  CwText('GAIN BACK CONTROL', 16, FontWeight.bold,
                   Colors.white, 2),

                  CwText('OF YOUR LIFE', 16, FontWeight.bold, 
                  Colors.white, 2),
                  
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 325,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(59, 88, 158, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color.fromRGBO(59, 88, 158, 1),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/fb_logo.jpg",
                              ),
                            ),
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 7,
                          ),

                          CwText('SIGNUP WITH FACEBOOK', 14,FontWeight.bold, 
                          Colors.white, 1.2),
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 325,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/google-WB-logo.png",
                              ),
                            ),
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 7,
                          ),

                          CwText('SIGNUP WITH GOOGLE',14,FontWeight.bold, 
                          Colors.black, 1.2),
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      child: CwText("Sign up with Email address", 14, 
                      FontWeight.bold, Color.fromRGBO(234, 205, 140, 1), 1)
                      ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(children: <InlineSpan>[
                    const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          letterSpacing: 1,
                          color: Colors.white),
                    ),
                    TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(234, 205, 140, 1)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          }),
                  ])),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
