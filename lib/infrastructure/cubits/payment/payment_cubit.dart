import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(ReportInitial());

  HiveService get _prefs => locator<HiveService>();

  void report(BuildContext context, [bool loading = true]) async {
    try {
      if (isUserInfoValid()) {
        if (loading) {
          emit(PaymentInProgress());
        }
        // final result = await ReportProvider.report(
        //   token: await _prefs.accessToken,
        //   seller: seller.valueOrNull,
        //   qty: productCount.valueOrNull,
        //   category: selectedSubCategory.valueOrNull!.id,
        //   tracking: trackingID.valueOrNull,
        //   price: price.valueOrNull,
        //   currency: priceType.valueOrNull!.toLowerCase(),
        //   invoice: image.valueOrNull,
        //   note: note.valueOrNull,
        // );
        //
        // if (isSuccess(result?.statusCode)) {
        //   emit(PaymentSuccess());
        // } else {
        //   emit(PaymentError(error: MyText.error + " ${result!.statusCode}"));
        // }
      } else {
        emit(PaymentError(error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PaymentError(error: MyText.network_error));
    } catch (e) {
      emit(PaymentError());
    }
  }

  //--------------------values:-----------------

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
    if (!isPaymentTypeIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    paymentType.close();
    return super.close();
  }
}
