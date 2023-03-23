import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailWidget extends StatelessWidget {
  const NewsDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: GetBuilder<NewsDetailController>(builder: (controller) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.title,
                    style: AppTextStyle.darkPrimary24_700,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.description,
                    style: AppTextStyle.darkPrimary14_600,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'By:- ',
                          style: AppTextStyle.darkPrimary13_400,
                          children: <TextSpan>[
                        TextSpan(
                            text: controller.author,
                            style: AppTextStyle.darkPrimary14_600),
                        TextSpan(
                            text: ' AT ',
                            style: AppTextStyle.darkPrimary13_400),
                        TextSpan(
                            text: controller.publishedAt,
                            style: AppTextStyle.darkPrimary14_600)
                      ])),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: controller.urlToImage,
                      placeholder: (context, url) =>
                          CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: Get.height * 0.20,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.content,
                    style: AppTextStyle.darkPrimary14_400,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GlobalButton(
                    text: 'Click for full article',
                    onTap: () async {
                      await launchUrl(
                        Uri.parse(controller.url),
                        mode: LaunchMode.inAppWebView,
                        webViewConfiguration:
                            const WebViewConfiguration(enableJavaScript: false),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
