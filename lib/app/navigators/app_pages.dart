import 'package:get/get.dart';
import 'package:news_app/app/app.dart';

class AppPages {
  static const initialRoute = AppRoutes.loginScreen;

  static const transitionDuration = Duration(
    milliseconds: 250,
  );

  static const pageTransition = Transition.cupertino;
  static final pages = <GetPage>[
    GetPage<LoginView>(
      transitionDuration: transitionDuration,
      name: AppRoutes.loginScreen,
      page: LoginView.new,
      binding: LoginBinding(),
      transition: pageTransition,
    ),
    GetPage<HomeView>(
      transitionDuration: transitionDuration,
      name: AppRoutes.homeScreen,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: pageTransition,
    ),
    GetPage<NewsDetailView>(
      transitionDuration: transitionDuration,
      name: AppRoutes.newsDetailScreen,
      page: NewsDetailView.new,
      binding: NewsDetailBinding(),
      transition: pageTransition,
    ),
  ];
}
