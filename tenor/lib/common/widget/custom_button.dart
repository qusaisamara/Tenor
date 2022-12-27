import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/Constantes.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double paddingLeft;
  final double paddingRight;
  final String buttonText;
  final double buttonBorderRadius;
  final VoidCallback? onPressed;
  final double fontSize;


  const CustomButton({super.key,

    this.width = 200,
    this.height = 50,
    this.paddingLeft = 25,
    this.paddingRight = 25,
    this.buttonText = '',
    this.buttonBorderRadius = 7,
    this.onPressed,
    this.fontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: paddingLeft, left: paddingRight),
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonBorderRadius),
                    side: const BorderSide(color: Colors.cyan))),
          ),
          child: CustomText(
            text: buttonText,
            size: fontSize.sp,
          ),
        ),
      ),
    );
  }
}
