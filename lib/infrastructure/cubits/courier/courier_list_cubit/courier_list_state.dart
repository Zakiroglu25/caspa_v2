import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';

abstract class CourierListState {}

class CourierListInitial extends CourierListState {}

class CourierListInProgress extends CourierListState {}
class CourierListDeleted extends CourierListState {}
class CourierListEdit extends CourierListState {}

class CourierListError extends CourierListState {
  String? error;

  CourierListError({this.error});
}

class CourierListNetworkError extends CourierListState {}

class CourierListSuccess extends CourierListState {
  final List<CourierOrder> courierList;
   final List<Package> packageList;
  CourierListSuccess({required this.courierList, required this.packageList});
}
