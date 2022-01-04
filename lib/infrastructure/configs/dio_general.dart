import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:dio/dio.dart';

import 'dio_auth.dart';

class DioG {
  static DioG? _instance;
  static late Dio dioG;

  DioG._internal();

  static Future<DioG> get instance async {
    if (_instance == null) {
      _instance = DioG._internal();
    }

    dioG = await Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        contentType: 'application/json',
        queryParameters: {"Accept": "application/json"},
        followRedirects: true,
        // headers: ApiKeys.header(token: _prefs.accessToken),

        validateStatus: (status) {
          return status! < 500;
        },
      ),
    )..interceptors.add(CustomInterceptors());

    return _instance!;
  }

  Dio get dio => dioG;
}
