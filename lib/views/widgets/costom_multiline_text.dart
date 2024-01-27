import 'package:flutter/material.dart';

class CustomMultiLineText extends StatelessWidget {
  CustomMultiLineText(
      {super.key,
      required this.title,
      this.textAlign = TextAlign.start,
      this.color});

  String title;

  TextAlign textAlign;

  Color? color = const Color(0xFF393F42);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: 'InterInter',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
