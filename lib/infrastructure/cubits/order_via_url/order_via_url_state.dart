abstract class OrderViaUrlState {}

class OrderViaUrlInitial extends OrderViaUrlState {}

class OrderViaUrlInProgress extends OrderViaUrlState {}

class OrderViaUrlError extends OrderViaUrlState {
  String? error;

  OrderViaUrlError({this.error});
}

class OrderViaUrlDeleted extends OrderViaUrlState {}

class OrderViaUrlEdited extends OrderViaUrlState {}

class OrderViaUrlSuccess extends OrderViaUrlState {
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;
}
