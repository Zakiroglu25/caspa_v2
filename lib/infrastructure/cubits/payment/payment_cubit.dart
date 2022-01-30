import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/payments_provider.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  HiveService get _prefs => locator<HiveService>();

  void getPaymentUrl(BuildContext context,
      {bool loading = true,
      required PaymentBalanceType paymentBalanceType}) async {
    try {
      if (isUserInfoValid()) {
        if (loading) {
          emit(PaymentInProgress());
        }

        final result = await PaymentsProvider.getPaymentUrl(
            amount: price.valueOrNull, paymentBalanceType: paymentBalanceType);
        bbbb("hjk: ${result.statusCode}");
        if (isSuccess(result.statusCode)) {
          emit(PaymentUrlFetched(url: result.data));
        } else {
          emit(PaymentError(error: MyText.error + " ${result.statusCode}"));
        }
      } else {
        emit(PaymentError(error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PaymentError(error: MyText.network_error));
    } catch (e, s) {
      eeee("getPaymentUrl cubit $e=>$s");
      emit(PaymentError());
    }
  }

  //--------------------values:-----------------

  //price
  final BehaviorSubject<double> price = BehaviorSubject<double>();

  Stream<double> get priceStream => price.stream;

  updatePrice(String value) {
    if (value == null || value.isEmpty) {
      price.sink.addError(MyText.field_is_not_correct);
    } else {
      price.sink.add(double.parse(value));
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPriceIncorrect => (!price.hasValue || price.value == null);

  //priceType
  final BehaviorSubject<PaymentType> paymentType =
      BehaviorSubject<PaymentType>.seeded(PaymentType.from_balance);

  Stream<PaymentType> get paymentTypeStream => paymentType.stream;

  updatePaymentType(PaymentType value) {
    if (value == null
        //|| value.isEmpty
        ) {
      //paymentType.value = '';
      paymentType.sink.addError(MyText.field_is_not_correct);
    } else {
      paymentType.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPaymentTypeIncorrect =>
      (!paymentType.hasValue || paymentType.value == null
      // || paymentType.value.isEmpty
      );

  ////validation
  bool isUserInfoValid() {
    if (!isPriceIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    price.close();
    return super.close();
  }
}
