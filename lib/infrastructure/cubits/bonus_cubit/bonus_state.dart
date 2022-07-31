import 'package:caspa_v2/infrastructure/models/remote/response/bonus_model.dart';

abstract class BonusState {}

class BonusInitial extends BonusState {}

class BonusInProgress extends BonusState {}

class BonusError extends BonusState {
  String? error;

  BonusError({this.error});
}

class BonusNetworkError extends BonusState {}

class BonusSuccess extends BonusState {
  BonusSuccess(this.bonusList);
  final List<Data> bonusList;
}
