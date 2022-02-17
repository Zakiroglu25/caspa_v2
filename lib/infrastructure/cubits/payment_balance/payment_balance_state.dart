abstract class PaymentBalanceState {}

class PaymentBalanceInitial extends PaymentBalanceState {}

class PaymentBalanceInProgress extends PaymentBalanceState {}

class PaymentBalanceSuccess extends PaymentBalanceState {}

class PaymentBalanceError extends PaymentBalanceState {
  String? error;

  PaymentBalanceError({this.error});
}

class PaymentBalanceUrlFetched extends PaymentBalanceState {
  String url;
  PaymentBalanceUrlFetched({required this.url});
}
