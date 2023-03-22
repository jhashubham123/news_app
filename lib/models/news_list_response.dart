class NewsListResponse {
  NewsListResponse({
    required this.status,
    required this.totalResult,
    required this.articles,
  });
  String status;
  int totalResult;
  List<Articles> articles;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      NewsListResponse(
        status: json['status'],
        totalResult: json['totalResults'],
        articles: List<Articles>.from(json['articles'].Map((x) => x)),
      );
}

class Articles {
  Articles(
    this.author,
    this.content,
    this.description,
    this.newsImage,
    this.newsRelatedUrl,
    this.publishAt,
    this.title,
  );
  String? author;
  String? title;
  String? description;
  String? newsRelatedUrl;
  String? newsImage;
  String? publishAt;
  String? content;
}
