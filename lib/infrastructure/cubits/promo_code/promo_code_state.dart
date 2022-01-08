import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class PromoCodeState {}

class ShopInitial extends PromoCodeState {}

class ShopInProgress extends PromoCodeState {}

class ShopError extends PromoCodeState {
  String? error;

  ShopError({this.error});
}

class ShopNetworkError extends PromoCodeState {}

class ShopSuccess extends PromoCodeState {
  ShopSuccess(this.shopList);

  final List<Shop> shopList;
}
