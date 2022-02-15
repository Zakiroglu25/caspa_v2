import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/payments_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import 'package_details_state.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsState> {
  PackageDetailsCubit() : super(PackageDetailsInitial());

  HiveService get _prefs => locator<HiveService>();

  /////////////////////////////////////////
  //-------P--A---C---K--A--G---E--------//
  /////////////////////////////////////////

  void packageMakePayment(
      {bool loading = true,
      required int id,
      required BuildContext context}) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    if (paymentType.value == MyText.byCard) {
      packagePayByCard(context, id: id);
    } else if (paymentType.value == MyText.fromBalance) {
      packagePayFromBalance(context, id: id);
    } else {}
  }

  void packagePayFromBalance(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result = await PaymentsProvider.packagePay(id: id);
      if (isSuccess(result.statusCode)) {
        emit(PackageDetailsPaid());
      } else {
        // Snack.display(context: context, message: result.data ?? MyText.error);
        emit(PackageDetailsPayError(error: result.data ?? MyText.error));
        // emit(PackageDetailsPaid());
      }
    } on SocketException catch (e) {
      emit(PackageDetailsNetworkError());
    } catch (e, s) {
      emit(PackageDetailsPayError(error: MyText.error));
      Recorder.recordCatchError(e, s, where: 'payFromBalance');
    }
  }

  void packagePayByCard(BuildContext context, {required int id}) async {
    try {
      final result = await PaymentsProvider.packageGetPaymentUrl(id: id);
      bbbb("hjk: ${result.statusCode}");
      if (isSuccess(result.statusCode)) {
        emit(PackageDetailsUrlFetched(url: result.data));
      } else {
        //Snack.display(context: context, message: result.data ?? MyText.error);
        emit(PackageDetailsPayError(error: result.data ?? MyText.error));
        // emit(PackageDetailsPaid());
      }
    } on SocketException catch (e) {
      emit(PackageDetailsNetworkError());
    } catch (e, s) {
      emit(PackageDetailsPayError(error: MyText.error));
      Recorder.recordCatchError(e, s, where: 'payFromBalance');
    }
  }

  /////////////////////////////////////////
  //-------O---R---D----E----R-----------//
  /////////////////////////////////////////

  void orderMakePayment(
      {bool loading = true,
      required int id,
      required BuildContext context}) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    if (paymentType.value == MyText.byCard) {
      orderPayByCard(context, id: id);
    } else if (paymentType.value == MyText.fromCashback) {
      orderPayFromCashback(context, id: id);
    } else if (paymentType.value == MyText.fromBalance) {
      orderPayFromBalance(context, id: id);
    } else {}
  }

  void orderPayFromBalance(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result =
          await PaymentsProvider.orderPay(idList: [id]);
      if (isSuccess(result.statusCode)) {
        emit(PackageDetailsPaid());
      } else {
        // Snack.display(context: context, message: result.data ?? MyText.error);
        emit(PackageDetailsPayError(error: result.data ?? MyText.error));
        // emit(PackageDetailsPaid());
      }
    } on SocketException catch (e) {
      emit(PackageDetailsNetworkError());
    } catch (e, s) {
      emit(PackageDetailsPayError(error: MyText.error));
      Recorder.recordCatchError(e, s, where: 'payFromBalance');
    }
  }

  void orderPayByCard(BuildContext context, {required int id}) async {
    try {
      final result = await PaymentsProvider.orderGetPaymentUrl(idList: [id]);
      bbbb("hjk: ${result.statusCode}");
      if (isSuccess(result.statusCode)) {
        emit(PackageDetailsUrlFetched(url: result.data));
      } else {
        //Snack.display(context: context, message: result.data ?? MyText.error);
        emit(PackageDetailsPayError(error: result.data ?? MyText.error));
        // emit(PackageDetailsPaid());
      }
    } on SocketException catch (e) {
      emit(PackageDetailsNetworkError());
    } catch (e, s) {
      emit(PackageDetailsPayError(error: MyText.error));
      Recorder.recordCatchError(e, s, where: 'payFromBalance');
    }
  }

  void orderPayFromCashback(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result =
          await PaymentsProvider.orderPayWithCashback(idList: [id]);
      if (isSuccess(result.statusCode)) {
        emit(PackageDetailsPaid());
      } else {
        // Snack.display(context: context, message: result.data ?? MyText.error);
        emit(PackageDetailsPayError(error: result.data ?? MyText.error));
        // emit(PackageDetailsPaid());
      }
    } on SocketException catch (e) {
      emit(PackageDetailsNetworkError());
    } catch (e, s) {
      emit(PackageDetailsPayError(error: MyText.error));
      Recorder.recordCatchError(e, s, where: 'payFromBalance');
    }
  }

  void paymentSuccess(
    BuildContext context, {
    bool loading = true,
  }) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    emit(PackageDetailsPaid());
  }

  //values
  ///////////////////////////////////////////////////

  //paymentType
  final BehaviorSubject<String> paymentType =
      BehaviorSubject<String>.seeded(MyText.fromBalance);

  Stream<String> get payTypeStream => paymentType.stream;

  updatePayType(String value) {
    if (value == null || value.isEmpty) {
      paymentType.value = '';
      paymentType.sink.addError(MyText.field_is_not_correct);
    } else {
      paymentType.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPayTypeIncorrect => (!paymentType.hasValue ||
      paymentType.value == null ||
      paymentType.value.isEmpty);

  @override
  Future<void> close() {
    // TODO: implement close
    paymentType.close();
    return super.close();
  }
}
