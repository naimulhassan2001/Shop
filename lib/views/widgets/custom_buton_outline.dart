import 'package:flutter/material.dart';

class CustomButtonOutLine extends StatelessWidget {
  CustomButtonOutLine(
      {super.key,
        required this.title,
        this.height = 56,
        this.fontSize = 18,
        this.radius = 8,
        this.width = 0.0,
        this.fixWidth = false,
        required this.onTap,
        this.textColor,
        this.backgroundColor
      });

  String title;
  Function() onTap;
  double height;
  double width ;
  bool fixWidth;
  double fontSize;
  double radius;
  Color? textColor = const Color(0xFF393F42);
  Color? backgroundColor = const Color(0xFFF0F2F1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: fixWidth ? width : null ,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color:  const Color(0xFFD9D9D9)!),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Center(
          child: Text(title,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
}