import 'package:dio/dio.dart';

class ApiHelper {
  static Dio _dio = Dio();

  static Future<Response> getData() async {
    final response = await _dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );

    return response;
  }
}
