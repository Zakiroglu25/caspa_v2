import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
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
import '../../../util/delegate/user_operations.dart';
import '../../data_source/promo_code_provider.dart';
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
    } else if (paymentType.value == MyText.fromCashback) {
      bbbb("yuyuyu:  ${paymentType.value}");
      packagePayFromCashback(context, id: id);
    } else if (paymentType.value == MyText.withPromoCode) {
      packagePayWithPromo(context, id: id);
    } else {}

    await getUserInfo();
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
      Recorder.recordCatchError(e, s, where: 'packagePayFromBalance');
    }
  }

  void packagePayByCard(BuildContext context, {required int id}) async {
    try {
      final result = await PaymentsProvider.packageGetPaymentUrl(id: id);
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
      Recorder.recordCatchError(e, s, where: 'packagePayByCard');
    }
  }

  void packagePayFromCashback(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result =
          await PaymentsProvider.packagePayWithCashback(id: id);
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
      Recorder.recordCatchError(e, s, where: 'packagePayFromCashback');
    }
  }

  void packagePayWithPromo(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result =
          await PaymentsProvider.packagePayWithPromo(id: id);
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
      Recorder.recordCatchError(e, s, where: 'packagePayFromPromo');
    }
  }

  //-------------------------------------//
  //-------c---h---e---c----k------------//
  //-------------------------------------//

  /////////////////////////////////////////
  //-------O---R---D----E----R-----------//
  /////////////////////////////////////////

  void orderMakePayment(
      {bool loading = true,
      required int id,
      required List<int> ids,
      required BuildContext context}) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    if (paymentType.value == MyText.byCard) {
      //orderPayByCard(context, id: id);
      orderListPayByCard(context, ids: ids);
    } else if (paymentType.value == MyText.fromCashback) {
      // orderPayFromCashback(context, id: id);
      orderListPayFromCashback(context, ids: ids);
    } else if (paymentType.value == MyText.fromBalance) {
      //orderPayFromBalance(context, id: id);
      orderListPayFromBalance(context, ids: ids);
    } else {}
    await getUserInfo();
  }

  void orderListMakePayment(
      {bool loading = true,
      required List<int> ids,
      required BuildContext context}) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    if (paymentType.value == MyText.byCard) {
      //orderPayByCard(context, id: id);
      orderListPayByCard(context, ids: ids);
    } else if (paymentType.value == MyText.fromCashback) {
      // orderPayFromCashback(context, id: id);
      orderListPayFromCashback(context, ids: ids);
    } else if (paymentType.value == MyText.fromBalance) {
      //orderPayFromBalance(context, id: id);
      orderListPayFromBalance(context, ids: ids);
    } else {}
    await getUserInfo();
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
      Recorder.recordCatchError(e, s, where: 'orderPayFromBalance');
    }
  }

  void orderPayByCard(BuildContext context, {required int id}) async {
    try {
      final result = await PaymentsProvider.orderGetPaymentUrl(idList: [id]);
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
      Recorder.recordCatchError(e, s, where: 'orderPayByCard');
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
      Recorder.recordCatchError(e, s, where: 'orderPayFromCashback');
    }
  }

  void orderListPayByCard(BuildContext context,
      {required List<int> ids}) async {
    try {
      final result = await PaymentsProvider.orderGetPaymentUrl(idList: ids);
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
      Recorder.recordCatchError(e, s, where: 'orderPayByCard');
    }
  }

  void orderListPayFromBalance(BuildContext context,
      {required List<int> ids}) async {
    try {
      final StatusDynamic result = await PaymentsProvider.orderPay(idList: ids);
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
      Recorder.recordCatchError(e, s, where: 'orderPayFromBalance');
    }
  }

  void orderListPayFromCashback(BuildContext context,
      {required List<int> ids}) async {
    try {
      final StatusDynamic result =
          await PaymentsProvider.orderPayWithCashback(idList: ids);
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
      Recorder.recordCatchError(e, s, where: 'orderPayFromCashback');
    }
  }

  /////////////////////////////////////////
  //-----C---O---U---R---I---E----R------//
  /////////////////////////////////////////

  void courierMakePayment(
      {bool loading = true,
      required int id,
      required BuildContext context}) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    //courierId vvvv
    // final int? id = await context.read<CourierCubit>().addCourier(context,packages: p);
    // bbbb("id: $id");
    //if (id != null) {
    if (paymentType.value == MyText.byCard) {
      courierPayByCard(context, id: id);
    } else if (paymentType.value == MyText.fromCashback) {
      courierPayFromCashback(context, id: id);
    } else if (paymentType.value == MyText.fromBalance) {
      courierPayFromBalance(context, id: id);
    } else {}
    await getUserInfo();
    //}
  }

  void courierPayFromBalance(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result = await PaymentsProvider.courierPay(id: id);
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
      Recorder.recordCatchError(e, s, where: 'courierPayFromBalance');
    }
  }

  void courierPayByCard(BuildContext context, {required int id}) async {
    try {
      final result = await PaymentsProvider.courierGetPaymentUrl(id: id);
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
      Recorder.recordCatchError(e, s, where: 'courierPayByCard');
    }
  }

  void courierPayFromCashback(BuildContext context, {required int id}) async {
    try {
      final StatusDynamic result =
          await PaymentsProvider.courierPayWithCashback(id: id);
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
      Recorder.recordCatchError(e, s, where: 'courierPayFromCashback');
    }
  }

  /////////////////////////////////////////
  //-----G---E---N---E---R---A----L------//
  /////////////////////////////////////////

  void paymentSuccess(
    BuildContext context, {
    bool loading = true,
  }) async {
    if (loading) {
      emit(PackageDetailsInProgress());
    }
    emit(PackageDetailsPaid());
  }

  Future<void> getUserInfo() async {
    await UserOperations.configUserDataWhenOpenApp(
      accessToken: _prefs.accessToken!,
      fcm: _prefs.fcmToken,
    );
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
    paymentType.close();
    return super.close();
  }
}
