import 'package:caspa_v2/infrastructure/models/requset/register_request_model.dart';
import 'package:caspa_v2/infrastructure/models/response/register_response_model.dart';
import 'package:caspa_v2/infrastructure/services/register/register_service.dart';

import '../../locator.dart';

class RegisterRepository {
  var registerService = locator.get<RegisterService>();

  Future<RegisterResponseModel> registerCivil(RegisterRequestModel body) async {
    return await registerService.registerCivil(body);
  }
}
