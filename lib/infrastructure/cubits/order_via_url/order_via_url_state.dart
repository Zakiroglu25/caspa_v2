

abstract class OrderViaUrlState {}

class OrderViaUrlInitial extends OrderViaUrlState {}

class OrderViaUrlInProgress extends OrderViaUrlState {}


class OrderViaUrlError extends OrderViaUrlState {

  String? error;

  OrderViaUrlError({this.error});
}
class TarifNetworkError extends OrderViaUrlState {}

class OrderViaUrlSuccess extends OrderViaUrlState {
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;
}
