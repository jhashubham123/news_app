import 'package:flutter/material.dart';
import 'package:news_app/app/app.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: NewsDetailWidget(),
    );
  }
}
