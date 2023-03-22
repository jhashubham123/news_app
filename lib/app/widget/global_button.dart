import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';

class GlobalButton extends StatelessWidget {
  GlobalButton({
    Key? key,
    required this.text,
    this.onTap,
    this.backgroundColor = AppColors.darkPrimaryColor,
    this.borderColor = Colors.transparent,
    this.borderEnabled,
    this.smallButton,
    this.height = 0.06,
  }) : super(key: key);
  final String text;
  final GestureTapCallback? onTap;
  Color backgroundColor;
  Color borderColor;
  final bool? borderEnabled;
  final bool? smallButton;
  final double height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * height,
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: smallButton == true && borderEnabled == true
              ? AppTextStyle.darkPrimary13_400
              : smallButton == true && borderEnabled != true
                  ? AppTextStyle.white_13_normal
                  : borderEnabled == true
                      ? AppTextStyle.darkPrimary16_700
                      : AppTextStyle.white_16_normal,
        ),
      ),
    );
  }
}
