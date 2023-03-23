import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_list_response.dart';

class HomeController extends GetxController {
  /// All variables here==============
  var tabindex = 0;
  var isLoading = true;
  var selectedNewsIds = [];

  /// All controllers related to current page here========

  /// Function to get change in bottom navigation bar========
  void changeTabIndex(int index) {
    tabindex = index;
    update();
  }

  ///Function to add selected News Ids in list
  saveBookMarks(index) {
    if (selectedNewsIds.contains(index)) {
      selectedNewsIds.removeAt(index);
    } else {
      selectedNewsIds.add(index);
    }
    update();
  }

  /// Instance for model class in which we will gonna pass json response in string form
  GetNewsResponse? getNewsResponse;

  /// Api call for news
  getNewsList() async {
    try {
      isLoading;
      var response = await http.get(Uri.parse(
          //'https://newsapi.org/v2/everything?q=Apple&from=2023-03-22&sortBy=popularity&apiKey=a82c731dc3c642f6a73db40c03e841f2' this is not working for me
          'https://newsapi.org/v2/top-headlines?country=US&apiKey=a82c731dc3c642f6a73db40c03e841f2'));
      if (response.body.isNotEmpty) {
        getNewsResponse = getNewsResponseFromJson(response.body);
        update();
      }
      print('bosy is ========= ${getNewsResponse!.articles[0].author}');
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNewsList();
  }
}
