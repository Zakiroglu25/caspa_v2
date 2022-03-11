import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';

abstract class CourierListState {}

class CourierListInitial extends CourierListState {}

class CourierListInProgress extends CourierListState {}

class CourierListError extends CourierListState {
  String? error;

  CourierListError({this.error});
}

class CourierListNetworkError extends CourierListState {}

class CourierListSuccess extends CourierListState {
  final List<Data> courierList;
  // final List<Products>? productList;
  CourierListSuccess(this.courierList);

}
