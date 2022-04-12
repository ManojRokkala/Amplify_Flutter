import 'dart:ui';

import 'package:amplifylife/widgets/cw_back_icon.dart';
import 'package:amplifylife/widgets/cw_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isNotVisible = true;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackIcon(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Image.asset(
                  "assets/images/amplify logo.png",
                  height: 70,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(16, 16, 16, 1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(200, 200, 200, 1), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(200, 200, 200, 1), width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.5),
                    ),
                    labelText: "Username or Email address",
                    labelStyle: const TextStyle(
                        letterSpacing: 1,
                        fontFamily: "poppins",
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) {
                    this.email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter an Email address';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                    obscureText: isNotVisible,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        color: Color.fromRGBO(200, 200, 200, 1),
                        onPressed: () {
                          setState(() {
                            isNotVisible = !isNotVisible;
                          });
                        },
                        icon: isNotVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(16, 16, 16, 1),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(200, 200, 200, 1),
                            width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                      ),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                          letterSpacing: 1,
                          fontFamily: "poppins",
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: null,
                      child: CwText("Forgotten password?", 14, FontWeight.bold,
                          Color.fromRGBO(234, 205, 140, 1), 1),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    final form = formKey.currentState!;

                    if (form.validate()) {
                      Navigator.pushNamed(context, '/timer');
                    }
                  },
                  child: Container(
                    width: 325,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(234, 205, 140, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: CwText(
                          'LOG IN', 16, FontWeight.bold, Colors.black, 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/fb_logo.jpg",
                        ),
                      ),
                      radius: 10,
                    ),
                    TextButton(
                      onPressed: null,
                      child: CwText("Continue with Facebook", 14,
                          FontWeight.w400, Colors.white, 1),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/google logo.jpg",
                        ),
                      ),
                      radius: 10,
                    ),
                    TextButton(
                        onPressed: null,
                        child: CwText("Continue with Google", 14,
                            FontWeight.w400, Colors.white, 1))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(TextSpan(children: <InlineSpan>[
                  const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Color.fromRGBO(234, 205, 140, 1)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/second');
                        }),
                ])),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
