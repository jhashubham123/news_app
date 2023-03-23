import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/utils/utility.dart';
import 'package:news_app/app/widget/widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.loginVectorIcon),
                Text(
                  'Welcome to, Newsflash👌',
                  style: AppTextStyle.darkPrimary24_600,
                ),
                Text(
                  'Login with any social media account listed below',
                  style: AppTextStyle.grey14_400,
                ),
                Utility.emptyBox(
                  context: context,
                  height: 0.05,
                ),
                socialMediaLogin(context: context),
                Utility.emptyBox(
                  context: context,
                  height: 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget socialMediaLogin({required BuildContext context}) {
  final size = MediaQuery.of(context).size;
  return GetBuilder<LoginController>(builder: (controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.dotGreyColor,
                thickness: 1,
              ),
            ),
            Text(
              '   Login with   ',
              style: AppTextStyle.black14_400,
            ),
            const Expanded(
              child: Divider(
                color: AppColors.dotGreyColor,
                thickness: 1,
              ),
            )
          ],
        ),
        Utility.emptyBox(
          context: context,
          height: 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              /// Retreived email from firebase
              onTap: () {
                NavigateTo.homeScreen();
              },
              child: Container(
                height: size.height * 0.07,
                width: size.width * 0.14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        scale: 2,
                        image: AssetImage(AppImages.colouredGoogleIcon)),
                    border: Border.all(
                      color: AppColors.dotGreyColor,
                    )),
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.14,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      scale: 2,
                      image: AssetImage(AppImages.colouredFacebookIcon)),
                  border: Border.all(
                    color: AppColors.dotGreyColor,
                  )),
            )
          ],
        ),
        SizedBox(
          height: Get.height * 0.05,
        ),
        GlobalButton(
          text: 'Login as guest',
          onTap: () {
            NavigateTo.homeScreen();
          },
        )
      ],
    );
  });
}
