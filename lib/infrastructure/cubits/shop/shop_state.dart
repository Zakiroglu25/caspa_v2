import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopInProgress extends ShopState {}

class ShopError extends ShopState {
  String? error;

  ShopError({this.error});
}

class ShopNetworkError extends ShopState {}

class ShopSuccess extends ShopState {
  ShopSuccess(this.shopList);

  final List<Shop> shopList;
}
