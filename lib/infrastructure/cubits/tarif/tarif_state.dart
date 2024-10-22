
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';

abstract class TarifState {}

class TarifInitial extends TarifState {}

class TarifInProgress extends TarifState {}


class TarifError extends TarifState {}
class TarifNetworkError extends TarifState {}

class TarifSuccess extends TarifState {
  TarifSuccess(this.tarifList);
  final List<Tariff>  tarifList;
}
