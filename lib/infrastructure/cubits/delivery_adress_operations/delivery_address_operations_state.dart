abstract class DeliveryAdressOperationsState {}

class DeliveryAdressOperationsInitial extends DeliveryAdressOperationsState {}

class DeliveryAdressOperationsInProgress extends DeliveryAdressOperationsState {
}

class DeliveryAdressOperationsError extends DeliveryAdressOperationsState {
  String? error;

  DeliveryAdressOperationsError({this.error});
}

class DeliveryAdressOperationsDeleted extends DeliveryAdressOperationsState {}

class DeliveryAdressOperationsEdited extends DeliveryAdressOperationsState {}

class DeliveryAdressOperationsSuccess extends DeliveryAdressOperationsState {
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;

  final int? id;

  DeliveryAdressOperationsSuccess({this.id});
}
