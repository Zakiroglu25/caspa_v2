import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:dio/dio.dart';

abstract class DioX {
  static final client = Dio(
    BaseOptions(
      baseUrl: ApiKeys.baseUrl,
      contentType: 'application/json',
      queryParameters: {"Accept":"application/json"},
      followRedirects: true,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );
}
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }
  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  //  return
     super.onResponse(response, handler);
  }
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    //return
      super.onError(err, handler);
  }
}