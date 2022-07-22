import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_state.dart';
import 'package:caspa_v2/infrastructure/data_source/order_via_link_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import '../../data_source/delivery_adress_provider.dart';
import '../../models/remote/response/regions_model.dart';
import 'delivery_adress_operations_state.dart';

class DeliveryAdressOperationsCubit
    extends Cubit<DeliveryAdressOperationsState> {
  DeliveryAdressOperationsCubit() : super(DeliveryAdressOperationsInitial());

  HiveService get _prefs => locator<HiveService>();

  void add(BuildContext context, [bool loading = true]) async {
    // try {
    //   if (isUserInfoValid()) {
    //     if (loading) {
    //       emit(DeliveryAdressOperationsInProgress());
    //     }
    //     final result = await DeliveryAdressProvider.add(
    //         qty: productCount.valueOrNull,
    //         price: price.valueOrNull,
    //         link: link.valueOrNull,
    //         cargo_price: localCargo.valueOrNull,
    //         detail: note.valueOrNull,
    //         token: await _prefs.accessToken);
    //
    //     bbbb("resoooo: " + result.toString());
    //
    //     if (isSuccess(result?.statusCode)) {
    //       emit(DeliveryAdressOperationsSuccess());
    //     } else {
    //       emit(DeliveryAdressOperationsError(
    //           error: MyText.error + " ${result!.statusCode}"));
    //     }
    //     emit(DeliveryAdressOperationsInProgress());
    //   } else {
    //     emit(DeliveryAdressOperationsError(
    //         error: MyText.all_fields_must_be_filled));
    //   }
    // } on SocketException catch (_) {
    //   //network olacaq
    //   emit(DeliveryAdressOperationsError(error: MyText.network_error));
    // } catch (e) {
    //   emit(DeliveryAdressOperationsError());
    // }
  }

  void get([bool loading = true]) async {
    // try {
    //   if (isUserDataValid()) {
    //     if (loading) {
    //       emit(DeliveryAdressOperationsInProgress());
    //     }
    //     final result = await DeliveryAdressProvider.add(
    //         qty: productCount.valueOrNull,
    //         price: price.valueOrNull,
    //         link: link.valueOrNull,
    //         cargo_price: localCargo.valueOrNull,
    //         detail: note.valueOrNull,
    //         token: await _prefs.accessToken);
    //
    //     bbbb("resoooo: " + result.toString());
    //
    //     if (isSuccess(result?.statusCode)) {
    //       emit(DeliveryAdressOperationsSuccess());
    //     } else {
    //       emit(DeliveryAdressOperationsError(
    //           error: MyText.error + " ${result!.statusCode}"));
    //     }
    //     emit(DeliveryAdressOperationsInProgress());
    //   } else {
    //     emit(DeliveryAdressOperationsError(
    //         error: MyText.all_fields_must_be_filled));
    //   }
    // } on SocketException catch (_) {
    //   //network olacaq
    //   emit(DeliveryAdressOperationsError(error: MyText.network_error));
    // } catch (e) {
    //   emit(DeliveryAdressOperationsError());
    // }
    emit(DeliveryAdressOperationsSuccess());
  }

  void edit(BuildContext context, {required LinkOrder order}) async {
    emit(DeliveryAdressOperationsInProgress());
    // try {
    //   final result = await OrderViaLinkProvider.editOrder(
    //     id: order.id!,
    //     qty: productCount.valueOrNull,
    //     price: price.valueOrNull,
    //     link: link.valueOrNull,
    //     cargo_price: localCargo.valueOrNull,
    //     detail: note.valueOrNull,
    //   );
    //
    //   if (isSuccess(result!.statusCode)) {
    //     emit(DeliveryAdressOperationsEdited());
    //   } else {
    //     emit(DeliveryAdressOperationsError(error: MyText.error));
    //   }
    // } on SocketException catch (_) {
    //   emit(DeliveryAdressOperationsError(error: MyText.network_error));
    // } catch (e) {
    //   print(e);
    //   emit(DeliveryAdressOperationsError(error: MyText.error + ": $e"));
    // }
  }

  //--------------------values:-----------------

  //selected  adress id
  final BehaviorSubject<int?> selectedAdressId = BehaviorSubject<int>();

  Stream<int?> get selectedAdressIdStream => selectedAdressId.stream;

  updateSelectedAdressId(int? value) {
    if (value == null) {
      selectedAdressId.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      selectedAdressId.sink.add(value);
    }
  }

  bool get isSelectedAdressIdIncorrect =>
      (!selectedAdressId.hasValue || selectedAdressId.value == null);

//note
  final BehaviorSubject<String> note = BehaviorSubject<String>();

  Stream<String> get noteStream => note.stream;

  updateNote(String value) {
    if (value == null || value.isEmpty) {
      note.value = '';
      note.sink.addError(MyText.field_is_not_correct);
    } else {
      note.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isNoteIncorrect =>
      (!note.hasValue || note.value == null || note.value.isEmpty);

  //details
  final BehaviorSubject<String> details = BehaviorSubject<String>();

  Stream<String> get detailsStream => note.stream;

  updateDetails(String value) {
    if (value == null || value.isEmpty) {
      details.value = '';
      details.sink.addError(MyText.field_is_not_correct);
    } else {
      details.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isDetailsIncorrect =>
      (!details.hasValue || details.value == null || details.value.isEmpty);

  //region
  final BehaviorSubject<Region?> region = BehaviorSubject<Region>();

  Stream<Region?> get regionStream => region.stream;

  updateRegion(Region? value) {
    if (value == null) {
      region.value = null;
      //region.sink.addError(MyText.field_is_not_correct);
    } else {
      region.sink.add(value);
    }
  }

  bool get isRegionIncorrect => (!region.hasValue || region.value == null);

  //is user data valid
  bool isUserDataValid() {
    if (!isRegionIncorrect && !isDetailsIncorrect && !isNoteIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    note.close();
    details.close();
    region.close();
    return super.close();
  }
}
