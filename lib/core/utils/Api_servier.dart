import 'package:dio/dio.dart';

 class ApiServier {
  final Dio dio ;
  static const String baseUrl = 'https://api.themoviedb.org/3/';

  ApiServier({required this.dio});
  Future<dynamic> get({required String path}) async {
    Response response = await dio.get("$baseUrl$path");
    return response.data;
  }

  Future<dynamic> post({required String path}) async {
    Response response = await Dio().post("$baseUrl$path");
    return response.data;
  }

  Future<dynamic> delet({required String path}) async {
    Response response = await Dio().delete("$baseUrl$path");
    return response.data;
  }
}
