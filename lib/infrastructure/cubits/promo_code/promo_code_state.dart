import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class PromoCodeState {}

class PromoCodeInitial extends PromoCodeState {}

class PromoCodeInProgress extends PromoCodeState {}

class PromoCodeError extends PromoCodeState {
  String? error;

  PromoCodeError({this.error});
}

class PromoCodeNetworkError extends PromoCodeState {}
class PromoCodeAdded extends PromoCodeState {}
class PromoCodeNotAdded extends PromoCodeState {}

class PromoCodeSuccess extends PromoCodeState {
  PromoCodeSuccess(this.shopList);

  final List<Shop> shopList;
}
