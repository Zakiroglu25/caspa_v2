import '../../models/remote/response/delivery_address_model.dart';
import '../../models/remote/response/regions_model.dart';

abstract class DeliveryAddressState {}

class DeliveryAdressInitial extends DeliveryAddressState {}

class DeliveryAdressInProgress extends DeliveryAddressState {}

class DeliveryAdressError extends DeliveryAddressState {
  String? error;

  DeliveryAdressError({this.error});
}

class DeliveryAdressDeleted extends DeliveryAddressState {}

class DeliveryAdressEdited extends DeliveryAddressState {}

class DeliveryAdressSuccess extends DeliveryAddressState {
  DeliveryAdressSuccess(
      {required this.deliveryAddress, required this.regionList});

  final List<DeliveryAddress>? deliveryAddress;
  final List<Region> regionList;
}
