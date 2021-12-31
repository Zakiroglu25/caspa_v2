

abstract class PaymentState {}

class ReportInitial extends PaymentState {}

class PaymentInProgress extends PaymentState {}


class PaymentError extends PaymentState {

  String? error;

  PaymentError({this.error});
}
class TarifNetworkError extends PaymentState {}

class PaymentSuccess extends PaymentState {
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;
}
