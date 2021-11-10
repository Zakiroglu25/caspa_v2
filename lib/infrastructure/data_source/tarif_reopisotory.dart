import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';

import '../../locator.dart';

class TarifRepository{
  final _services = locator.get<TarifRepository>();

  Future<PriceModel> getPrice() async{
    return _services.getPrice();
  }
}