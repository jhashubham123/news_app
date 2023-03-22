import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/utils/utility.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: searchNewsWidget(context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.whiteColor,
          currentIndex: controller.tabindex,
          fixedColor: AppColors.whiteColor,
          onTap: controller.changeTabIndex,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home_outlined,
                color: AppColors.primaryColor,
              ),
              activeIcon:
                  Icon(Icons.home_filled, color: AppColors.darkPrimaryColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline, color: AppColors.primaryColor),
              activeIcon:
                  Icon(Icons.bookmark, color: AppColors.darkPrimaryColor),
              label: '',
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.tabindex,
          children: const [
            HomeWidget(),
            // TripScreen(),
          ],
        ),
      );
    });
  }
}

/// Search baar fr search specific news

Widget searchNewsWidget(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: TextFormField(
          cursorColor: AppColors.greyTextColor,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: AppTextStyle.hintText,
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColors.borderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColors.borderColor)),
          ),
        ),
      ),
      Utility.emptyBox(
        context: context,
        width: 0.02,
      ),
      GestureDetector(
        child: Icon(
          Icons.search_rounded,
          color: AppColors.darkPrimaryColor,
        ),
      )
    ],
  );
}
