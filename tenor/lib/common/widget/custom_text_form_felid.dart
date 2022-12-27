// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/Constantes.dart';

class CustomTextFormFiled extends StatelessWidget {
  final icon;
  final double height;
  final double radius;
  final double fontsize;
  final Color textcolor;
  final Color iconcolor;
  final Color backGroudcolor;
  final String hinttext;
  final TextInputType? type;
  final String prefix;
  var suffixIcon;
  final TextEditingController controllar;
  final Function(String)? onChanged;
  final String? Function(String? val)? validate;
  CustomTextFormFiled(
      {super.key,
      required this.controllar,
      this.height = 14,
      this.backGroudcolor = Colors.white,
      this.radius = 7,
      this.fontsize = 14,
      this.textcolor = Colors.black,
      this.icon,
      this.iconcolor = Colors.black54,
      this.hinttext = '',
      this.prefix = '',
      this.validate,
      this.suffixIcon,
      this.type,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        onChanged: (text) {
          onChanged;
        },
        textDirection: TextDirection.ltr,
        validator: validate,
        cursorHeight: 2.h,
        cursorColor: Colors.black,
        keyboardType: type ?? TextInputType.text,
        controller: controllar,
        style: TextStyle(
          fontSize: fontsize,
          color: textcolor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          contentPadding: EdgeInsets.zero,
          prefix: Text(prefix),
          prefixIcon: Icon(
            icon,
            color: iconcolor,
          ),
          hintText: hinttext,
          hintTextDirection: TextDirection.ltr,
          hintStyle: TextStyle(fontFamily: 'Cairo', fontSize: 13.sp),
          suffixIcon: Icon(
            suffixIcon,
            color: secounderyColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.w),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.w),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
