import 'package:get/get.dart';
import 'package:news_app/app/app.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
  }
}
