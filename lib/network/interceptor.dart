import 'package:dio/dio.dart';

class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    consoleLog('--------------------------------------------------------');
    consoleLog(options.method + " " + options.baseUrl + options.path);
    consoleLog('--------------------------------------------------------');
    consoleLog('HEADER: ' + options.headers.toString());
    if (options.queryParameters.isNotEmpty) {
      consoleLog('--------------------------------------------------------');
      consoleLog('Query Params: ' + options.queryParameters.toString());
    }
    if (options.data != null) {
      consoleLog('--------------------------------------------------------');
      consoleLog('Request Body: ' + options.data.toString());
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    consoleLog('--------------------------------------------------------');
    consoleLog('Dio Error: ' + err.type.toString());
    consoleLog('Error Message: ' + err.message.toString());
    consoleLog('--------------------------------------------------------');
    consoleLog(err.response.toString());
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    consoleLog('--------------------------------------------------------');
    consoleLog('STATUS: ' +
        response.statusCode.toString() +
        ' ' +
        response.statusMessage.toString());
    consoleLog('--------------------------------------------------------');
    consoleLog(response.toString());
    super.onResponse(response, handler);
  }

  void consoleLog(String string) {
    if (string.length <= 0) return;
    const int n = 1000;
    int startIndex = 0;
    int endIndex = n;
    while (startIndex < string.length) {
      if (endIndex > string.length) endIndex = string.length;
      print(string.substring(startIndex, endIndex));
      startIndex += n;
      endIndex = startIndex + n;
    }
  }
}
