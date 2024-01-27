
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, required this.title,
    this.fontSize =14,
    this.fontWeight = FontWeight.w500,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.color});

  String title ;
  double fontSize ;
  Color? color = const Color(0xFF393F42) ;
  FontWeight fontWeight ;
  MainAxisAlignment  mainAxisAlignment ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          maxLines: 1,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
              fontFamily: 'Inter',
            fontWeight: fontWeight
          ),
        ),
      ],
    );

  }
}