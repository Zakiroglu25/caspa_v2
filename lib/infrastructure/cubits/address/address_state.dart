import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressInProgress extends AddressState {}

class AddressError extends AddressState {

  final String? error;

  AddressError({this.error});
}

class AddressNetworkError extends AddressState {}

class AddressSuccess extends AddressState {
  AddressSuccess(this.adress);

  final List<Adress> adress;
}
