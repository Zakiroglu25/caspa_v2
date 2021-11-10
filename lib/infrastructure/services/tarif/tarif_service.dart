
import 'package:caspa_v2/infrastructure/configs/base_url.dart';
import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tarif_service.g.dart';

@RestApi(baseUrl: ConfigUrl.baseUrl)
abstract class TarifService {
  factory TarifService(Dio dio, {String baseUrl}) = _TarifService;

  @GET('public/prices')
  Future<PriceModel> getRecipes();
}
