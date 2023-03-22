import 'package:get/get.dart';
import 'package:news_app/app/app.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
