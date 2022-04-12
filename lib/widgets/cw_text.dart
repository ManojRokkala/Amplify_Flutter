import 'package:flutter/material.dart';

class CwText extends StatelessWidget {
  String text = 'data';
  double? size;
  FontWeight? fontWeight;
  Color? color;
  double? letterSpacing;

  CwText(
    this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.letterSpacing,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: size,
            fontFamily: 'poppins',
            fontWeight: fontWeight,
            color: color ?? Colors.black,
            letterSpacing:letterSpacing),
      ),
    );
  }
}


