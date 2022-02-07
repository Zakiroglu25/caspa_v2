import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';

abstract class OrderViaUrlListState {}

class AttorneyListInitial extends OrderViaUrlListState {}

class OrderViaUrlListInProgress extends OrderViaUrlListState {}

class OrderViaUrlListError extends OrderViaUrlListState {
  final String? error;

  OrderViaUrlListError({this.error});
}

class OrderViaUrlListNetworkError extends OrderViaUrlListState {}

class OrderViaUrlListDeleted extends OrderViaUrlListState {}

class OrderViaUrlListEdited extends OrderViaUrlListState {}

class OrderViaUrlListSuccess extends OrderViaUrlListState {
  OrderViaUrlListSuccess(this.orders);

  final List<LinkOrder> orders;
}
