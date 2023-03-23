import 'package:get/get.dart';

class NewsDetailController extends GetxController {
  /// Get all arguments from last page
  var content = Get.arguments['content'];
  var description = Get.arguments['description'];
  var publishedAt = Get.arguments['publishedAt'];
  var title = Get.arguments['title'];
  var url = Get.arguments['url'];
  var urlToImage = Get.arguments['urlToImage'];
  var author = Get.arguments['author'];
}
