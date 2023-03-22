import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/utils/utility.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              children: [
                /// List of news will show here
                newsList(context),
              ],
            ),
          ),
        )),
      );
    });
  }
}

/// News list widget================
Widget newsList(BuildContext context) {
  return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  'https://media.aintitcool.com/static/social/facebook-wide-dannie.png',
                  height: Get.height * 0.20,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Author',
                          style: AppTextStyle.darkPrimary13_500,
                        ),
                        Text(
                          '2 days ago',
                          style: AppTextStyle.darkPrimary13_500,
                        )
                      ],
                    ),
                    Text(
                      'Apple\'s 10.9-inch iPad is \$50 off right now',
                      style: AppTextStyle.darkPrimary24_700,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Utility.emptyBox(
          context: context,
          height: 0.05,
        );
      },
      itemCount: 20);
}
