import '../../models/remote/response/delivery_address_model.dart';
import '../../models/remote/response/regions_model.dart';

abstract class DeliveryAddressCurrentState {}

abstract class DeliveryAddressCurrentError {}

class DeliveryAdressCurrentInitial extends DeliveryAddressCurrentState {}

class DeliveryAdressCurrentInProgress extends DeliveryAddressCurrentState {}

class DeliveryAdressCurrentAdded extends DeliveryAddressCurrentState {}

class DeliveryAdressCurrentDisabled
    implements DeliveryAddressCurrentError, DeliveryAddressCurrentState {}

class DeliveryAdressCurrentDenied
    implements DeliveryAddressCurrentError, DeliveryAddressCurrentState {}

class DeliveryAdressCurrentError
    implements DeliveryAddressCurrentError, DeliveryAddressCurrentState {
  String? error;

  DeliveryAdressCurrentError({this.error});
}

class DeliveryAdressCurrentSuccess extends DeliveryAddressCurrentState {
  DeliveryAdressCurrentSuccess({required this.address, required this.location});
  //
  final String address;
  final String location;
  // c List<DeliveryAddress>? deliveryAddress;
  // final List<Region> regionList;
}
