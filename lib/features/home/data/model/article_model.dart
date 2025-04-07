import 'package:news_app/core/constants/app_strings.dart';

class ArticleModel {
  String title = '';
  String description = '';
  String url = '';
  String urlToImage = '';
  String publishedAt = '';

  ArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json[AppStrings.title] ?? '',
      description: json[AppStrings.description] ?? '',
      url: json[AppStrings.url] ?? '',
      urlToImage: json[AppStrings.urlToImage] ?? '',
      publishedAt: json[AppStrings.publishedAt] ?? '',
    );
  }
}
