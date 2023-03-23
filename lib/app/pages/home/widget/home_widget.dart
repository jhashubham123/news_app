import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/utils/utility.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              children: [
                /// List of news will show here
                newsList(context),
              ],
            ),
          ),
        )),
      );
    });
  }
}

/// News list widget================
Widget newsList(BuildContext context) {
  return GetBuilder<HomeController>(builder: (controller) {
    return controller.isLoading == true
        ? SizedBox(
            height: Get.height * 0.80,
            width: Get.width,
            child: CupertinoActivityIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              var getNews = controller.getNewsResponse!.articles[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: CachedNetworkImage(
                        imageUrl: getNews.urlToImage,
                        placeholder: (context, url) =>
                            CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: Get.height * 0.20,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            getNews.title,
                            style: AppTextStyle.darkPrimary24_700,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  getNews.author!,
                                  style: AppTextStyle.darkPrimary13_500,
                                ),
                              ),
                              Text(
                                DateFormat('MMM d hh:mm a')
                                    .format(getNews.publishedAt),
                                style: AppTextStyle.darkPrimary13_500,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  NavigateTo.newsDetailScreen(
                                    author: getNews.author!,
                                    content: getNews.content!,
                                    description: getNews.description,
                                    publishedAt: DateFormat('MMM d hh:mm a')
                                        .format(getNews.publishedAt),
                                    title: getNews.title,
                                    url: getNews.url,
                                    urlToImage: getNews.urlToImage,
                                  );
                                  // await launchUrl(
                                  //   Uri.parse(getNews.url),
                                  //   mode: LaunchMode.inAppWebView,
                                  //   webViewConfiguration:
                                  //       const WebViewConfiguration(
                                  //           enableJavaScript: false),
                                  // );
                                },
                                child: Chip(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: AppColors.darkPrimaryColor,
                                  label: Text(
                                    'Read more',
                                    style: AppTextStyle.white_13_normal,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    controller.saveBookMarks(index);
                                  },
                                  child: Icon(
                                    controller.selectedNewsIds.contains(index)
                                        ? Icons.bookmark_add_rounded
                                        : Icons.bookmark_border,
                                    size: 25,
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Utility.emptyBox(
                context: context,
                height: 0.05,
              );
            },
            itemCount: controller.getNewsResponse!.articles.length);
  });
}
