import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child:  Icon(
          Icons.chevron_left_outlined,
          color: Colors.white,
          size: 30,),
    );
  }
}