import 'package:caspa_v2/infrastructure/models/remote/response/gift_balance.dart';

abstract class GiftBalanceState {}

class GiftBalanceInitial extends GiftBalanceState {}

class GiftBalanceInProgress extends GiftBalanceState {}

class GiftBalanceInAdding extends GiftBalanceState {}

class GiftBalanceError extends GiftBalanceState {
  String? error;

  GiftBalanceError({this.error});
}

class GiftBalanceNetworkError extends GiftBalanceState {}

class GiftBalanceAdded extends GiftBalanceState {}

class GiftBalanceNotAdded extends GiftBalanceState {
  String? error;

  GiftBalanceNotAdded({this.error});
}

class GiftBalanceSuccess extends GiftBalanceState {
  GiftBalanceSuccess(this.giftList);

  final List<GiftBalance> giftList;
}
