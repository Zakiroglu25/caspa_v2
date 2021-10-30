import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:dio/dio.dart';

abstract class DioX {
  static final client = Dio(
    BaseOptions(
      baseUrl: ApiKeys.baseUrl,
      contentType: 'application/json',
    ),
  );
}
