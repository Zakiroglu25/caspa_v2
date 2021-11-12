import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';

abstract class TarifState {}

class TarifInitial extends TarifState {}

class TarifInProgress extends TarifState {}

class TarifUpdating extends TarifState {}

class TarifError extends TarifState {}

class TarifSuccess extends TarifState {
  TarifSuccess(this.tarif);
  final PriceModel  tarif;
}
