import 'package:flutter/material.dart';

Widget customBtn(BuildContext context, String text, Color bgColor, Color textColor) {
  return Container(
    height: MediaQuery.of(context).size.width*0.13,
    width: MediaQuery.of(context).size.width*0.85,
    color: bgColor,
    alignment: Alignment.center,
    child: Text(text, style: TextStyle(color: textColor, fontSize: 20),),
  );
}