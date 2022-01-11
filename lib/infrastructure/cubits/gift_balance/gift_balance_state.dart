import 'package:caspa_v2/infrastructure/models/remote/response/gift_balance.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/gift_balance_page.dart';

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
  GiftBalanceSuccess(this.promoList);

  final List<GiftBalance> promoList;
}
