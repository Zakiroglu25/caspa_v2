import 'package:caspa_v2/infrastructure/models/remote/response/calculate_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class CalculateKgState {}

class CalculateKgInitial extends CalculateKgState {}

class CalculateKgProgress extends CalculateKgState {}

class CalculateKgInAdding extends CalculateKgState {}

class CalculateKgError extends CalculateKgState {
  String? error;

  CalculateKgError({this.error});
}

class CalculateKgNetworkError extends CalculateKgState {}

class CalculateKgAdded extends CalculateKgState {
  CalculateKgAdded(this.calculate);

  final String  calculate;
}

class CalculateKgNotAdded extends CalculateKgState {
  String? error;

  CalculateKgNotAdded({this.error});
}

// class CalculateKgSuccess extends CalculateKgState {
//   CalculateKgSuccess(this.promoList);
//
//   final List<PromoCode> promoList;
//}
