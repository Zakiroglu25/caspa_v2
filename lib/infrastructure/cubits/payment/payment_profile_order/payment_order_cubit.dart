import 'package:caspa_v2/infrastructure/data_source/payments_provider.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/locator.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_order_state.dart';

class PaymentsOrderCubit extends Cubit<PaymentsOrderState> {
  PaymentsOrderCubit() : super(PaymentsOrderInitial()) {}

  HiveService get _prefs => locator<HiveService>();

  final prices_controller = TextEditingController();

  void paymentsOrder() async {
    try {
      final result = await PaymentsProvider.getPaymentUrl(
          amount: null, paymentBalanceType: PaymentBalanceType.order);
      if (isSuccess(result.statusCode)) {
        emit(PaymentsOrderSuccess());
      } else {
        emit(PaymentsOrderError(error: 'Error'));
      }
    } catch (e) {
      emit(PaymentsOrderError(error: 'Error'));
      print(e);
    }
  }
}
