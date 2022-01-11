import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class PromoCodeState {}

class PromoCodeInitial extends PromoCodeState {}

class PromoCodeInProgress extends PromoCodeState {}

class PromoCodeInAdding extends PromoCodeState {}

class PromoCodeError extends PromoCodeState {
  String? error;

  PromoCodeError({this.error});
}

class PromoCodeNetworkError extends PromoCodeState {}

class PromoCodeAdded extends PromoCodeState {}

class PromoCodeNotAdded extends PromoCodeState {
  String? error;

  PromoCodeNotAdded({this.error});
}

class PromoCodeSuccess extends PromoCodeState {
  PromoCodeSuccess(this.promoList);

  final List<PromoCode> promoList;
}
