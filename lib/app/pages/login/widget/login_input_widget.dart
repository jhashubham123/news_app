import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/utils/utility.dart';

import '../../../widget/global_textfield.dart';

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address',
            style: AppTextStyle.darkPrimary16_700,
          ),
          Utility.emptyBox(
            context: context,
            height: 0.01,
          ),
          GlobalTextField(hintText: 'Your email address'),
          // SizedBox(
          //   height: size.height * 0.04,
          // ),
          Utility.emptyBox(
            context: context,
            height: 0.04,
          ),
          Text(
            'Password',
            style: AppTextStyle.darkPrimary16_700,
          ),
          Utility.emptyBox(
            context: context,
            height: 0.01,
          ),
          GlobalTextField(
            hintText: 'Your password',
            obscureText: controller.passwordVisible,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.passwordVisible == false
                    ? controller.passwordVisible = true
                    : controller.passwordVisible = false;
                controller.update();
              },
              child: Icon(
                controller.passwordVisible == true
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ],
      );
    });
  }
}
