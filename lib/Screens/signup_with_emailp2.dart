import 'package:amplifylife/widgets/cw_back_icon.dart';
import 'package:amplifylife/widgets/cw_text.dart';
import 'package:amplifylife/widgets/cw_tff_decor.dart';
import 'package:flutter/material.dart';

class EmailSignupPage2 extends StatefulWidget {
  const EmailSignupPage2({Key? key}) : super(key: key);

  @override
  State<EmailSignupPage2> createState() => _EmailSignupPage2State();
}

class _EmailSignupPage2State extends State<EmailSignupPage2> {
  final _formKey = GlobalKey<FormState>();

  bool passwordEightCharacters = false;
  bool aCapitalLetter = false;
  bool aLowerCaseLetter = false;
  bool hasANumber = false;

  onPasswordChanged(String password) {
    final numRegex = RegExp(r'[0-9]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final uppercaseRegex = RegExp(r'[A-z]');

    setState(() {
      passwordEightCharacters = false;
      if (password.length >= 8) passwordEightCharacters = true;

      //hasANumber = false;
      if (numRegex.hasMatch(password)) {
        hasANumber = true;
      }

      if (lowercaseRegex.hasMatch(password)) {
        aLowerCaseLetter = true;
      }

      if (uppercaseRegex.hasMatch(password)) {
        aCapitalLetter = true;
      }
    });
  }

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    super.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: AppBar(
          toolbarHeight: 150,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const BackIcon(),
              ),

              //SizedBox(height: 6,),

              CwText('SIGN UP', 18, FontWeight.bold,
                  const Color.fromRGBO(234, 205, 140, 1), 1),

              Row(
                children: [
                  SizedBox(
                    width: 160,
                    child: Divider(
                      thickness: 4,
                      color: Color.fromRGBO(234, 205, 140, 1),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 160,
                    child: Divider(
                      thickness: 4,
                      color: Color.fromRGBO(234, 205, 140, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 45),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CwText("Choose a password ", 14, FontWeight.bold,
                      Colors.black, 1),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    onChanged: (password)=> onPasswordChanged(password),
                    obscureText: true,
                    controller: password,
                    decoration: buildDecoration(
                        Color.fromRGBO(245, 245, 245, 1), "Password"),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter New Password";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPassword,
                    decoration: buildDecoration(Color.fromRGBO(245, 245, 245, 1), 
                    'Confirm password'),
                    
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Re-Enter New Password";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      } 
                      else if (password.text != confirmPassword.text) {
                        return "Password must be same as above";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(passwordEightCharacters ? Icons.done : Icons.clear,
                          color: passwordEightCharacters
                              ? Colors.green
                              : Colors.red),
                      Text(
                        'Minimum of 8 characters',
                        style: TextStyle(
                            color: passwordEightCharacters
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(aCapitalLetter? Icons.done : Icons.clear,
                          color: aCapitalLetter
                              ? Colors.green: Colors.red),
                      Text(
                        'A capital letter',
                        style: TextStyle(
                            color: aCapitalLetter
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(aLowerCaseLetter ? Icons.done : Icons.clear,
                          color: aLowerCaseLetter
                              ? Colors.green
                              : Colors.red),
                      Text(
                        'A lower case letter',
                        style: TextStyle(
                            color:
                                aLowerCaseLetter ? Colors.green : Colors.red),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(hasANumber ? Icons.done : Icons.clear,
                          color: hasANumber
                              ? Colors.green
                              : Colors.red),
                      Text('A number',
                          style: TextStyle(
                              color: hasANumber
                                  ? Colors.green
                                  : Colors.red)),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                  ),
                  GestureDetector(
                    child: Center(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 325,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(234, 205, 140, 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                            child: CwText('CONTINUE', 16, FontWeight.bold,
                                Colors.black, 1)),
                      ),
                    ),
                    onTap: () {
                      _formKey.currentState!.validate();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
