import 'dart:html';

import 'package:amplifylife/widgets/cw_back_icon.dart';
import 'package:amplifylife/widgets/cw_text.dart';
import 'package:amplifylife/widgets/cw_tff_decor.dart';
import 'package:flutter/material.dart';

class EmailSignup extends StatefulWidget {
  EmailSignup({Key? key}) : super(key: key);

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  bool genderSelected = false;
  bool isChecked = false;
  String? valueChoosen;
  final daysPerWeek = [
    'Once a week',
    'Twice a week',
    'Thrice a week',
    'Four times a week',
    'Five times a week',
    'Six times a week',
    'Everyday'
  ];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'poppins',
            color: Colors.black,
            letterSpacing: 0.8),
      ));

  showFloatingSnackbar(String text) {
    SnackBar(
      content: Text(
        text,
        style:
            TextStyle(fontFamily: 'poppins', fontSize: 10, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black,
      shape: StadiumBorder(),
      duration: Duration(seconds: 5),
    );
  }

  bool selectedGenderMale = false;
  bool selectedGenderFeMale = false;
  bool selectedGenderNA = false;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: AppBar(
          toolbarHeight: 130,
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
                  icon: const BackIcon()),

              //SizedBox(height: 10,),
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
                      thickness: 2,
                      color: Color.fromRGBO(200, 200, 200, 1),
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
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CwText("Whats your email address? ", 14, FontWeight.bold,
                      Colors.black, 1),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                      controller: emailController,
                      decoration: buildDecoration(null, 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter an Email address';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please enter a valid Email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 25),
                  CwText("Whats your gender?", 14, FontWeight.bold,
                      Colors.black, 1),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Male'),
                      Checkbox(
                          shape: CircleBorder(),
                          activeColor: Colors.green[400],
                          value: selectedGenderMale,
                          checkColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              if (selectedGenderMale = value!) {
                                selectedGenderFeMale = false;
                                selectedGenderNA = false;
                              }
                              ;
                            });
                          }),
                      SizedBox(width: 16),
                      Text('Female'),
                      Checkbox(
                          shape: CircleBorder(),
                          activeColor: Colors.green[400],
                          value: selectedGenderFeMale,
                          checkColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              if (selectedGenderFeMale = value!) {
                                selectedGenderMale = false;
                                selectedGenderNA = false;
                              }
                              ;
                            });
                          }),
                      SizedBox(width: 16),
                      Text('N/A'),
                      Checkbox(
                          shape: CircleBorder(),
                          activeColor: Colors.green[400],
                          value: selectedGenderNA,
                          checkColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              if (selectedGenderNA = value!) {
                                selectedGenderMale = false;
                                selectedGenderFeMale = false;
                              }
                            });
                          }),
                    ],
                  ),
                  SizedBox(height: 18),
                  CwText("How much do you train?", 14, FontWeight.bold,
                      Colors.black, 1),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 42,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Color.fromRGBO(200, 200, 200, 1),
                        width: 1.5,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: valueChoosen,
                        isExpanded: true,
                        hint: Text(
                          'Please select here',
                          style: TextStyle(fontSize: 12),
                        ),
                        icon: Icon(Icons.expand_more_rounded),
                        iconSize: 20,
                        items: daysPerWeek.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.valueChoosen = value),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 325,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(234, 205, 140, 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: CwText(
                              'NEXT', 16, FontWeight.bold, Colors.black, 1),
                        ),
                      ),
                      onTap: () {
                        final form = formKey.currentState!;
                        final snackBar = SnackBar(content: Text("Enter data"));

                        (selectedGenderFeMale ||
                                selectedGenderMale ||
                                selectedGenderNA)
                            ? genderSelected = true
                            : genderSelected = false;

                        if (form.validate() && genderSelected != true) {
                          //new SnackBar(content: Text('Select gender'));
                        }

                        if (form.validate() && genderSelected == true) {
                          Navigator.pushNamed(context, '/fourth');
                        }
                      },
                    ),
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
