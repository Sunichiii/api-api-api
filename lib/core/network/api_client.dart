import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.headers = {'Content-Type': 'application/json'};
  }

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> put(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }
}
