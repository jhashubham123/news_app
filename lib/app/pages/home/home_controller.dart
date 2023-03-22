import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  /// All variables here==============
  var tabindex = 0;

  /// All controllers related to current page here========

  /// Function to get change in bottom navigation bar========
  void changeTabIndex(int index) {
    tabindex = index;
    update();
  }

  /// Api call for news
  getNewsList() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=Apple&from=2023-03-21&sortBy=popularity&apiKey=a82c731dc3c642f6a73db40c03e841f2'));
    print('bosy is ========= ${response.body}');
  }

  @override
  void onInit() {
    super.onInit();
    getNewsList();
  }
}
