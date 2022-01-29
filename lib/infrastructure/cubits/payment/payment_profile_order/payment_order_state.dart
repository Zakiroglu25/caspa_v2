// Project imports:

import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';

abstract class PaymentsOrderState {}

class PaymentsOrderInitial extends PaymentsOrderState {}

class PaymentsOrderInProgress extends PaymentsOrderState {}

class PaymentsOrderEdited extends PaymentsOrderState {}

class PaymentsOrderError extends PaymentsOrderState {
  String error;

  PaymentsOrderError({required this.error});
}

class PaymentsOrderSuccess extends PaymentsOrderState {}
