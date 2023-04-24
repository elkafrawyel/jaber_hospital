import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utilities/http/dio/utils/GlobalState.dart';

class ApiService {
  static const baseUrl = 'http://34.163.160.147/backend/api/';

  static Dio dioClient(){
    String? token = GlobalState.instance.get("token");
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "Accept": "application/json",
        'Authorization': token,
      },
      validateStatus: (status) {
        return status! <= 500;
      },
      connectTimeout: 90000,
      receiveTimeout: 90000,
    );

    Dio _dio = Dio(options)
      // ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true)
      );

    // _dio.interceptors.add(LoggingInterceptor());
    return _dio;
  }

  // DioCacheManager _getCacheManager() {
  //   if (null == _manager) {
  //     _manager = DioCacheManager(CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
  //   }
  //   return _manager;
  // }

  static Future<Response<dynamic>> post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
        var options,
  }) {
    final response = dioClient().post(
      path,
      data: jsonEncode(body!),
      // data: formData ?? FormData.fromMap(body!),
      // options: options??Options(contentType: Headers.acceptHeader),
      onSendProgress: (x, y) {
        if (kDebugMode) {
          print(x);
        }
      },
    );
    return response;
  }

  static Future<Response<dynamic>> get(String path) {
    final response = dioClient().get(path);
    return response;
  }

  static Future<Response<dynamic>> delete(String path) {
    final response = dioClient().delete(path);
    return response;
  }
}
