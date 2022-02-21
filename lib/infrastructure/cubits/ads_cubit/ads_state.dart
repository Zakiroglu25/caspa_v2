import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class AdsState {}

class AdsInitial extends AdsState {}

class AdsInProgress extends AdsState {}

class AdsError extends AdsState {
  String? error;

  AdsError({this.error});
}

class AdsNetworkError extends AdsState {}

class AdsSuccess extends AdsState {
  AdsSuccess(this.shopList);

  final List<Shop> shopList;
}
