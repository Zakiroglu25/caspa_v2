import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';

abstract class CourierState {}

class CourierInitial extends CourierState {}

class CourierInProgress extends CourierState {}

class CourierInProgressButton extends CourierState {}

class CourierableFetched extends CourierState {
  final List<Package>? packageList;
  final List<Region>? regionList;

  CourierableFetched({required this.packageList, required this.regionList});
}

class CourierError extends CourierState {
  String? error;

  CourierError({this.error});
}

class CourierOperationFail extends CourierState {}

class CourierContinueButtonActive extends CourierState {}

class CourierContinueButtonPassive extends CourierState {}

class CourierSuccess extends CourierState {
  CourierSuccess();
}
