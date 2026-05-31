import 'package:dio/dio.dart';
import 'package:my_app/utils/dio_connector.dart';

class PostsServices {
  static Future<Response> getPosts() async {
    final response = await DioConnector.dio.get("posts");
    return response;
  }
}
