import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.title,
      this.height = 56,
      this.fontSize = 18,
      this.radius = 8,
      this.width = 100,
      this.fixWidth = false,
      required this.onTap});

  String title;
  Function() onTap;
  double height;
  double fontSize;
  double radius;
  double width;
  bool fixWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: fixWidth ? width : null,
          decoration: ShapeDecoration(
            color: const Color(0xFF67C4A7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
