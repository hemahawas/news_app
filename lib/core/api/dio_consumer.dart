import 'package:dio/dio.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/errors/exceptions.dart';

class DioConsumer {
  static late Dio dio;

  DioConsumer() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json', 'lang': 'en'},
      ),
    );
  }

  Future getData({required String path, Map<String, dynamic>? query}) async {
    try {
      return await dio.get(path, queryParameters: query);
    } on DioException {
      throw ServerException();
    }
  }
}
