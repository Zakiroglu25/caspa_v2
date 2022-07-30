import '../../models/remote/response/delivery_address_model.dart';
import '../../models/remote/response/regions_model.dart';

abstract class DeliveryAdressState {}

class DeliveryAdressInitial extends DeliveryAdressState {}

class DeliveryAdressInProgress extends DeliveryAdressState {}

class DeliveryAdressError extends DeliveryAdressState {
  String? error;

  DeliveryAdressError({this.error});
}

class DeliveryAdressDeleted extends DeliveryAdressState {}

class DeliveryAdressEdited extends DeliveryAdressState {}

class DeliveryAdressSuccess extends DeliveryAdressState {
  DeliveryAdressSuccess(
      {required this.deliveryAddress, required this.regionList});

  final List<DeliveryAddress>? deliveryAddress;
  final List<Region> regionList;
}
