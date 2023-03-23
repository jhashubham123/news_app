import 'package:get/get.dart';
import 'package:news_app/app/pages/news_dtails/news_details_controller.dart';

class NewsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NewsDetailController(),
      fenix: true,
    );
  }
}
