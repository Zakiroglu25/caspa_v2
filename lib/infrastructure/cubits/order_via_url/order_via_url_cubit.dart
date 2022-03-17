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
import 'order_via_url_state.dart';

class OrderViaUrlCubit extends Cubit<OrderViaUrlState> {
  OrderViaUrlCubit() : super(OrderViaUrlInitial());

  HiveService get _prefs => locator<HiveService>();

  void addOrderViaLink(BuildContext context, [bool loading = true]) async {
    try {
      if (isUserInfoValid()) {
        if (loading) {
          emit(OrderViaUrlInProgress());
        }
        final result = await OrderViaLinkProvider.orderViaLink(
            qty: productCount.valueOrNull,
            price: price.valueOrNull,
            link: link.valueOrNull,
            cargo_price: localCargo.valueOrNull,
            detail: note.valueOrNull,
            token: await _prefs.accessToken);

        bbbb("resoooo: " + result.toString());

        if (isSuccess(result?.statusCode)) {
          emit(OrderViaUrlSuccess());
        } else {
          emit(
              OrderViaUrlError(error: MyText.error + " ${result!.statusCode}"));
        }
        emit(OrderViaUrlInProgress());
      } else {
        emit(OrderViaUrlError(error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(OrderViaUrlError(error: MyText.network_error));
    } catch (e) {
      emit(OrderViaUrlError());
    }
  }

  void edit(BuildContext context, {required LinkOrder order}) async {
    emit(OrderViaUrlInProgress());
    try {
      final result = await OrderViaLinkProvider.editOrder(
        id: order.id!,
        qty: productCount.valueOrNull,
        price: price.valueOrNull,
        link: link.valueOrNull,
        cargo_price: localCargo.valueOrNull,
        detail: note.valueOrNull,
      );

      if (isSuccess(result!.statusCode)) {
        emit(OrderViaUrlEdited());
      } else {
        emit(OrderViaUrlError(error: MyText.error));
      }
    } on SocketException catch (_) {
      emit(OrderViaUrlError(error: MyText.network_error));
    } catch (e) {
      print(e);
      emit(OrderViaUrlError(error: MyText.error + ": $e"));
    }
  }

  //--------------------values:-----------------

  //link
  final BehaviorSubject<String> link = BehaviorSubject<String>();

  Stream<String> get linkStream => link.stream;

  updateLink(String value) {
    if (value == null || value.isEmpty) {
      link.value = '';
      link.sink.addError(MyText.field_is_not_correct);
    } else if (!StringOperations.urlIsValid(value)) {
      link.sink.addError(MyText.field_is_not_correct);
    } else {
      link.sink.add(value);
    }
    //isUserInfoValid();
  }

  bool get isLinkIncorrect => (!link.hasValue ||
      link.value == null ||
      link.value.isEmpty ||
      !StringOperations.urlIsValid(link.valueOrNull));

//productCount
  final BehaviorSubject<int> productCount = BehaviorSubject<int>();

  Stream<int> get productCountStream => productCount.stream;

  updateProductCount(String value) {
    if (value == null) {
      // productCount.value = '';
      productCount.sink.addError(MyText.field_is_not_correct);
    } else {
      productCount.sink.add(int.parse(value));
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isProductCountIncorrect =>
      (!productCount.hasValue || productCount.value == null);

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

  //localCargo
  final BehaviorSubject<double> localCargo = BehaviorSubject<double>();

  Stream<double> get localCargoStream => localCargo.stream;

  updateLocalCargo(String value) {
    if (value == null || value.isEmpty) {
      localCargo.sink.addError(MyText.field_is_not_correct);
    } else {
      localCargo.sink.add(double.parse(value));
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isLocalCargoIncorrect =>
      (!localCargo.hasValue || localCargo.value == null);

  //priceType
  final BehaviorSubject<String> priceType =
      BehaviorSubject<String>.seeded(MyText.tryy);

  Stream<String> get priceTypeStream => priceType.stream;

  updatepriceType(String value) {
    if (value == null || value.isEmpty) {
      priceType.value = '';
      priceType.sink.addError(MyText.field_is_not_correct);
    } else {
      priceType.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPriceTypeIncorrect => (!priceType.hasValue ||
      priceType.value == null ||
      priceType.value.isEmpty);

  ////validation
  bool isUserInfoValid() {
    if (!isNoteIncorrect &&
        !isLinkIncorrect &&
        !isProductCountIncorrect &&
        !isPriceIncorrect &&
        !isPriceTypeIncorrect &&
        !isLocalCargoIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    note.close();
    productCount.close();
    localCargo.close();
    priceType.close();
    price.close();
    link.close();
    return super.close();
  }
}
