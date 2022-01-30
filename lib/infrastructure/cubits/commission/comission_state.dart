import 'package:caspa_v2/infrastructure/models/remote/response/general_response_model.dart';

abstract class CommissionState {}

class CommissionInitial extends CommissionState {}

class CommissionInProgress extends CommissionState {}

class CommissionError extends CommissionState {
  String? error;

  CommissionError({this.error});
}

class CommissionNetworkError extends CommissionState {}

class CommissionSuccess extends CommissionState {
  CommissionSuccess(this.commission);

  final GeneralResponse<String> commission;
}
