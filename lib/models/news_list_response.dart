// To parse this JSON data, do
//
//     final getNewsResponse = getNewsResponseFromJson(jsonString);

import 'dart:convert';

GetNewsResponse getNewsResponseFromJson(String str) =>
    GetNewsResponse.fromJson(json.decode(str));

class GetNewsResponse {
  GetNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory GetNewsResponse.fromJson(Map<String, dynamic> json) =>
      GetNewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"] as String? ?? '',
        title: json["title"] as String? ?? '',
        description: json["description"] as String? ?? '',
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] as String? ?? '',
      );
}
