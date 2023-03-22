import 'package:flutter/material.dart';
import 'package:news_app/app/app.dart';

class GlobalTextField extends StatelessWidget {
  GlobalTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.filled = true,
    this.fillColor = AppColors.whiteColor,
  });
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  GestureTapCallback? onTap;
  bool? filled;
  Color? fillColor;
  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      style: AppTextStyle.black14_400,
      obscureText: obscureText,
      cursorColor: AppColors.darkPrimaryColor,
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppTextStyle.hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
              ))),
    );
  }
}
