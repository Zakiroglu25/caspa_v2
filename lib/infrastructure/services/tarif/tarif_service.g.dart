// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarif_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TarifService implements TarifService {
  _TarifService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://caspa.az/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PriceModel> getRecipes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PriceModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'public/prices',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PriceModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
