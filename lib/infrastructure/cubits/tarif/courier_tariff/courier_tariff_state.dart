import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';

abstract class CourierTarifState {}

class CourierTarifInitial extends CourierTarifState {}

class CourierTarifInProgress extends CourierTarifState {}

class CourierTarifError extends CourierTarifState {}

class CourierTarifNetworkError extends CourierTarifState {}

class CourierTarifSuccess extends CourierTarifState {
  CourierTarifSuccess(this.tarifList);
  final List<Region> tarifList;
}
