abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentInProgress extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentError extends PaymentState {
  String? error;

  PaymentError({this.error});
}

class TarifNetworkError extends PaymentState {}

class PaymentUrlFetched extends PaymentState {
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;
  String url;

  PaymentUrlFetched({required this.url});
}
