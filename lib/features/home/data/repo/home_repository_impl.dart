import 'package:either_dart/src/either.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/model/article_model.dart';
import 'package:news_app/features/home/data/repo/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  DioConsumer dioConsumer;

  HomeRepositoryImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, List<ArticleModel>>> getData(String category) async {
    try {
      List<ArticleModel> articles = [];
      dynamic response = await dioConsumer.getData(
        path: EndPoints.headlines,
        query: {
          'max': 15,
          'lang': 'en',
          'country': 'us',
          'q': category,
          'apikey': '8dc65983333c90f219a91b829a8e10cf',
        },
      );
      var data = response.data['articles'];
      for (var article in data) {
        articles.add(ArticleModel.fromJson(article));
      }
      return Right(articles);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> getSearchData(
    String query,
  ) async {
    try {
      List<ArticleModel> articles = [];
      dynamic response = await dioConsumer.getData(
        path: EndPoints.search,
        query: {
          'max': 15,
          'lang': 'en',
          'country': 'us',
          'q': query,
          'apiKey': '8dc65983333c90f219a91b829a8e10cf',
        },
      );
      var data = response.data['articles'];
      for (var article in data) {
        articles.add(ArticleModel.fromJson(article));
      }
      return Right(articles);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
