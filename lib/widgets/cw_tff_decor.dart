import 'package:flutter/material.dart';

InputDecoration buildDecoration(
  Color? fillColor,
  String? text,
) {
  return InputDecoration(
    filled: true,
    fillColor: (fillColor==null)?Color.fromRGBO(245, 245, 245, 1): fillColor ,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide:
          const BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide:
          const BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    focusedErrorBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide:const BorderSide(color: Colors.red, width: 1.5),),
    labelText: text,
    labelStyle: const TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        color: Color.fromRGBO(159, 159, 159, 1)),
  );
}


/*
InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.5),
                        ),
                        labelText: "Email",
                        labelStyle: const TextStyle(
                            fontFamily: "poppins",
                            fontSize: 14,
                            color: Color.fromRGBO(159, 159, 159, 1)),
                      ),
*/ 
