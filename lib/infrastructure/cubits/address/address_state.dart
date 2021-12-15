import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressInProgress extends AddressState {}

class AddressError extends AddressState {}

class AddressNetworkError extends AddressState {}

class AddressSuccess extends AddressState {
  AddressSuccess(this.data);

  final List<Data> data;
}
