import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';

import '../../models/remote/response/delivery_address_model.dart';

abstract class CourierState {}

class CourierInitial extends CourierState {}

class CourierInProgress extends CourierState {}

class CourierAddressError extends CourierState {}

class CourierInProgressButton extends CourierState {}

class CourierableFetched extends CourierState {
  final List<Package>? packageList;
  final List<Region>? regionList;
  final DeliveryAddress? address;

  CourierableFetched(
      {required this.packageList, required this.regionList, this.address});
}

//error emeliyyatdan evvelki xetalar ucun
class CourierError extends CourierState {
  String? error;

  CourierError({this.error});
}

//operation fail emeliyyat zamani olacag xetalar ucun
class CourierOperationFail extends CourierState {}

class CourierConfigured extends CourierState {}

class CourierAdded extends CourierState {
  int courierId;

  CourierAdded(this.courierId);
}

class CourierEdited extends CourierState {
  String message;
  int courierId;
  CourierEdited(this.message, this.courierId);
}

class CourierSuccess extends CourierState {
  CourierSuccess();
}
