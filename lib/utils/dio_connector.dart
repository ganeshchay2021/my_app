import 'package:dio/dio.dart';

class DioConnector {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );
}