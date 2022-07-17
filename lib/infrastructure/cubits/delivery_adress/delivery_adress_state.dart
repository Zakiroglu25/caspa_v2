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
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;
}
