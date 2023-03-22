import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
  } catch (e) {
    debugPrint('Main exception is $e');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData myTheme = ThemeData(
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: AppColors.whiteColor,
    centerTitle: true,
    elevation: 0,
    shadowColor: Colors.transparent,
    titleTextStyle: AppTextStyle.appBarStyle,
  ),
  scaffoldBackgroundColor: Colors.white,
);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Car Rental',
      getPages: AppPages.pages,
      initialRoute: AppPages.initialRoute,
      theme: myTheme,
    );
  }
}

///Scroll View glow is coming from [GlowingOverscrollIndicator] So , we make a
/// custom scrollBehaviour with [buildOverscrollIndicator], So we can remove
/// that glow from every childScrollView.
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
