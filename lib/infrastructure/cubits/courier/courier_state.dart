import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';

abstract class CourierState {}

class CourierInitial extends CourierState {}

class CourierInProgress extends CourierState {}

class CourierableFetched extends CourierState {
  final List<Package>? packageList;

  CourierableFetched(this.packageList);
}

class CourierError extends CourierState {
  String? error;

  CourierError({this.error});
}

class CourierEnterMail extends CourierState {}

class CourierEnterCode extends CourierState {}

class CourierNewPass extends CourierState {}

class CourierContinueButtonActive extends CourierState {}

class CourierContinueButtonPassive extends CourierState {}

class CourierSuccess extends CourierState {
  CourierSuccess();
}
