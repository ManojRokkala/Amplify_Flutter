import 'dart:async';

import 'package:flutter/material.dart';

class CoundownTimer extends StatefulWidget {
  const CoundownTimer({Key? key}) : super(key: key);

  @override
  State<CoundownTimer> createState() => _CoundownTimerState();
}

class _CoundownTimerState extends State<CoundownTimer> {
  int time = 5;
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5));
    
    Navigator.pop(context);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          ("$time"),
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
