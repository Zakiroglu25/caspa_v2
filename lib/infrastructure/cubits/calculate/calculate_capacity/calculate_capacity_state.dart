import 'package:caspa_v2/infrastructure/models/remote/response/calculate_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

import '../../../models/remote/response/capacity_model.dart';

abstract class CalculateCapacityState {}

class CalculateCapacityInitial extends CalculateCapacityState {}

class CalculateCapacityProgress extends CalculateCapacityState {}

class CalculateCapacityInAdding extends CalculateCapacityState {}

class CalculateCapacityError extends CalculateCapacityState {
  String? error;

  CalculateCapacityError({this.error});
}

class CalculateCapacityNetworkError extends CalculateCapacityState {}

class CalculateCapacityAdded extends CalculateCapacityState {
  CalculateCapacityAdded(this.price);
  final int price;

}

class CalculateCapacityNotAdded extends CalculateCapacityState {
  String? error;

  CalculateCapacityNotAdded({this.error});
}

// class CalculateKgSuccess extends CalculateKgState {
//   CalculateKgSuccess(this.promoList);
//
//   final List<PromoCode> promoList;
//}
