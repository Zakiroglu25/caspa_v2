import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/locator.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioAuth {
  static HiveService get _prefs => locator<HiveService>();

  static DioAuth? _instance;
  static late Dio dioAuth;

  DioAuth._internal();

  static Future<DioAuth> get instance async {
    _instance ??= DioAuth._internal();

    dioAuth = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        // contentType: 'application/json',
        queryParameters: {"Accept": "application/json"},
        followRedirects: true,
        headers: ApiKeys.header(token: _prefs.accessToken),
        validateStatus: (status) {
          //  return status! < 500;
          return true;
        },
      ),
    )
      ..interceptors.add(CustomInterceptors())
      ..interceptors.add(TokenInterceptor());

    return _instance!;
  }

  Dio get dio => dioAuth;
}

class JwtInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    // final accessToken = sharedPrefs.getString('accessToken');

    // if (accessToken != null) {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    handler.next(options);
  }
}

class CustomInterceptors extends Interceptor {
  HiveService get _prefs => locator<HiveService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    if (!isSuccess(response.statusCode)) {
      // llll("user: ${_prefs.user}"+"\n request body: "+response.requestOptions.data.toString());
      Recorder.recordResponseError(response);
    }
    //  return
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    eeee(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    Recorder.recordDioError(err);
    //return
    super.onError(err, handler);
  }
}
//

class TokenInterceptor extends Interceptor {
  static HiveService get _prefs => locator<HiveService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    final token = _prefs.accessToken;
    options.headers['Authorization'] = "Bearer $token";
    super.onRequest(options, handler);
  }
}
