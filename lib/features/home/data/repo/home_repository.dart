import 'package:either_dart/either.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/model/article_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ArticleModel>>> getData(String category);
  Future<Either<Failure, List<ArticleModel>>> getSearchData(String query);
}
