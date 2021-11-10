import 'package:caspa_v2/infrastructure/configs/base_url.dart';
import 'package:caspa_v2/infrastructure/models/requset/register_request_model.dart';
import 'package:caspa_v2/infrastructure/models/response/register_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'register_service.g.dart';

@RestApi(baseUrl: ConfigUrl.baseUrl)
abstract class RegisterService{
  factory RegisterService(Dio dio,{String baseUrl}) = _RegisterService;


  @POST('user/register')
Future<RegisterResponseModel> registerCivil(
@Body() RegisterRequestModel registerBody
);
}