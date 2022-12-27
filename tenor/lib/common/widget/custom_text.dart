
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const CustomText(
      {super.key, this.text = '',
      this.size = 14,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Cairo'),
    );
  }
}
