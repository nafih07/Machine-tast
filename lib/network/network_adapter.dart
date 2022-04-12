import 'package:machine_test/helper/helper.dart';
import 'package:machine_test/model/model.dart';
import 'package:machine_test/network/interceptor.dart';
import 'package:dio/dio.dart';

import 'network.dart';

class NetworkAdapter {
  static final NetworkAdapter shared = NetworkAdapter._privateConstructor();

  NetworkAdapter._privateConstructor();

  static BaseOptions options = new BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: Headers.jsonContentType,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      });

  static LogInterceptor logInterceptor = new LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      request: true);

  Dio _dioInstance() {
    Dio dio = new Dio(options);
    dio.interceptors.add(CustomLogInterceptor());
    options.headers.addAll({'Content-Type': 'application/json'});
    return dio;
  }

  Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? queryParams}) async {
    try {
      Map<String, dynamic> header = await _authenticateRequest();
      Response response = await _dioInstance().request(
        endPoint,
        data: queryParams,
        options: Options(method: 'GET', headers: header),
      );
      return _checkAndReturnResponse(response);
    } on DioError catch (error) {
      return _handleException(error);
    }
  }

  Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? queryParams}) async {
    try {
      options.headers = await _authenticateRequest();
      Response response = await _dioInstance().request(endPoint,
          data: params,
          queryParameters: queryParams,
          options: Options(method: "POST"));
      return _checkAndReturnResponse(response);
    } on DioError catch (error) {
      return _handleException(error);
    }
  }

  Future<Response> put(
      {required String endPoint,
        Map<String, dynamic>? params,
        Map<String, dynamic>? queryParams}) async {
    try {
      options.headers = await _authenticateRequest();
      Response response = await _dioInstance().request(endPoint,
          data: params,
          queryParameters: queryParams,
          options: Options(method: "PUT"));
      return _checkAndReturnResponse(response);
    } on DioError catch (error) {
      return _handleException(error);
    }
  }

  Future<Response> postMultipart(
      {required String endPoint, required FormData formData}) async {
    try {
      options.headers = await _authenticateRequest();
      Response response = await _dioInstance()
          .request(endPoint, data: formData, options: Options(method: "POST"));
      return _checkAndReturnResponse(response);
    } on DioError catch (error) {
      return _handleException(error);
    }
  }

  Future<Map<String, dynamic>> _authenticateRequest() async {
    Map<String, dynamic> header = {};
    // User? currentUser = await SharedPreferenceHelper.shared.getUser();
    // if (currentUser != null && currentUser.authToken != null)
    //   header = {
    //     'authorization': "Bearer " + currentUser.authToken.toString(),
    //   };
    return header;
  }

  dynamic _checkAndReturnResponse(Response response) {
    String? description;
    if (response.data is Map) {
      description = response.data.containsKey('message')
          ? response.data['message']
          : null;
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        if (response.data == null) {
          throw FetchDataException(
              'Returned response data is null : ${response.statusMessage}');
        }

        return response;
      case 400:
        throw BadRequestException(description ?? response.statusMessage);
      case 401:
      case 403:
        throw UnauthorisedException(description ?? response.statusMessage);
      case 404:
        throw NotFoundException(description ?? response.statusMessage);
      case 500:
        throw InternalServerException(description ?? response.statusMessage);
      default:
        throw FetchDataException("Oops, Something went wrong");
    }
  }

  dynamic _handleException(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw FetchDataException('Request time out error');
      case DioErrorType.response:
        break;
      case DioErrorType.cancel:
        throw FetchDataException('Request Cancelled');
      case DioErrorType.other:
        if (error.message.contains('SocketException')) {
          throw NoConnectivityException("No Internet Connection");
        } else {
          throw FetchDataException("Oops, Something went wrong");
        }
    }
  }
}
