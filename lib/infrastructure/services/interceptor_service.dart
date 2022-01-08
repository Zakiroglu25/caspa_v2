import 'package:dio/dio.dart';
import 'package:logging/logging.dart';


final _logger = Logger('LogInterceptor');

class LogInterceptorService extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _logger.info('${options.method}: ${options.uri}');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    _logger.fine('${response.statusMessage}: ${response.data}');

    try {
      //final genericResponse = response as GenericResponseBody;

      if (response.statusCode == 404) {
        // todo: you should log out
      }
    } catch (_) {}

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    _logger.severe('${err.error} => ${err.stackTrace}');
    handler.next(err);
  }
}
