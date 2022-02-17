// Project imports:

import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';

abstract class AddAttorneysState {}

class AddAttorneysInitial extends AddAttorneysState {}

class AddAttorneysInProgress extends AddAttorneysState {}
class AddAttorneysEdited extends AddAttorneysState {}

class AddAttorneysError extends AddAttorneysState {
  String error;

  AddAttorneysError({required this.error});
}

class AddAttorneysSuccess extends AddAttorneysState {
}
