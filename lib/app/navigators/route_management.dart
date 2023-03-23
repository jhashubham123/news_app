import 'package:get/get.dart';
import 'package:news_app/app/app.dart';

class NavigateTo {
  static void homeScreen() {
    Get.offNamed(AppRoutes.homeScreen);
  }

  static void newsDetailScreen({
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) {
    Get.toNamed(AppRoutes.newsDetailScreen, arguments: {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    });
  }
}
