import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:readmore/readmore.dart';

class Utility {
  static SizedBox emptyBox({
    required BuildContext context,
    double height = 0.0,
    double width = 0.0,
  }) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * height,
      width: size.width * width,
    );
  }

/////Readmore text to trim lines =============

  static Widget readMoreText({
    required String text,
    int trimLisnes = 5,
  }) {
    return ReadMoreText(
      text,
      style: AppTextStyle.light_primary_14_400_height,
      textAlign: TextAlign.left,
      trimLines: trimLisnes,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' ...Show More',
      trimExpandedText: ' ...Show Less',
      moreStyle: AppTextStyle.darkPrimary13_400,
      lessStyle: AppTextStyle.darkPrimary13_400,
    );
  }

  ///Close any open dialogue
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }
}
