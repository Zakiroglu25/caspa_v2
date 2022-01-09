import 'package:caspa_v2/infrastructure/models/remote/response/gift_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class GiftState {}

class GiftInitial extends GiftState {}

class GiftInProgress extends GiftState {}

class GiftError extends GiftState {
  String? error;

  GiftError({this.error});
}

class GiftNetworkError extends GiftState {}
class GiftAdded extends GiftState {}
class GiftNotAdded extends GiftState {}

class GiftSuccess extends GiftState {
  GiftSuccess(this.giftList);

  final List<Data> giftList;
}
