import 'package:dio/dio.dart';

class HttpManager {
  var _dio = Dio();

  HttpManager._internal();

  static HttpManager _singleton = HttpManager._internal();

  factory HttpManager() => _singleton;

  get(url, param) async {
    if (param == null) {
      return await _dio.get(url);
    }
    return await _dio.get(url, queryParameters: param);
  }

  post(url, param) async {
    return await _dio.post(url, data: param);
  }
}