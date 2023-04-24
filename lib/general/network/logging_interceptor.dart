import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("<-- HTTP INFORMATION-->");
    log("--> ${options.headers.toString().replaceAll(',', '\n')}");
    log("--> ${options.method}");
    log("--> ${options.path}");
    log("<-- END HTTP -->");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
      (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        log(responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      log(response.data.toString());
    }
    log("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("<-- Error -->");
    log("Error->${err.error}");
    log("Message->${err.message}");
    super.onError(err, handler);
  }
}
