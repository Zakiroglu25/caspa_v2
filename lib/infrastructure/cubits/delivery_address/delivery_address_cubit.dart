import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_state.dart';
import 'package:caspa_v2/infrastructure/data_source/order_via_link_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/delivery_address_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/infrastructure/services/navigation_service.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/courier_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import '../../../util/delegate/pager.dart';
import '../../../util/screen/alert.dart';
import '../../../util/screen/snack.dart';
import '../../data_source/delivery_adress_provider.dart';
import '../../data_source/public_provider.dart';
import '../../models/remote/response/regions_model.dart';
import 'delivery_address_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  DeliveryAddressCubit() : super(DeliveryAdressInitial());

  HiveService get _prefs => locator<HiveService>();
  final context = NavigationService.instance.navigationKey?.currentContext;
  List<Region> regionList = [];

  void get([bool loading = true]) async {
    try {
      if (loading) {
        emit(DeliveryAdressInProgress());
      }
      final resultAddress = await DeliveryAdressProvider.getAddresses();
      final resultRegions = await PublicProvider.getRegions();
      if (resultAddress != null && isSuccess(resultRegions.statusCode)) {
        regionList = resultRegions.data;
        final List<DeliveryAddress>? addresses = resultAddress.data;
        determineSelectedAddress(addresses: addresses);
        emit(DeliveryAdressSuccess(
            regionList: regionList, deliveryAddress: addresses));
      } else {
        emit(DeliveryAdressError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressError(error: MyText.network_error));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAdressError());
    }
    // emit(DeliveryAdressSuccess());
  }

  void setAddress(
      {bool loading = true, required DeliveryAddress address}) async {
    await _prefs.persistAddress(address: address);
  }

  void determineSelectedAddress(
      {required List<DeliveryAddress>? addresses}) async {
    try {
      final selected =
          CourierOperations.determineSelectedAddress(addresses: addresses);
      if (selected != null) {
        updateSelectedAdressId(selected);
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
  }

  void delete(int id, [bool loading = true]) async {
    try {
      if (loading) {
        emit(DeliveryAdressInProgress());
      }
      final result = await DeliveryAdressProvider.delete(id: id);
      if (isSuccess(result?.statusCode)) {
        emit(DeliveryAdressDeleted());
        // Snack.display(context: context, message: MyText.operationIsSuccess);
      } else {
        emit(DeliveryAdressError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressError(error: MyText.network_error));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAdressError());
    }
    get();
  }

  void goToAddPage(
      {required BuildContext context,
      required List<Region> regions,
      DeliveryAddress? deliveryAddress}) async {
    try {
      showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Pager.deliveryAddressOperations(
            regions: regions, deliveryAddress: deliveryAddress),
      );
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressError(error: MyText.network_error));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAdressError());
    }
  }

  //--------------------values:-----------------

  //selected  adress id
  final BehaviorSubject<int?> selectedAdressId = BehaviorSubject<int>();

  Stream<int?> get selectedAdressIdStream => selectedAdressId.stream;

  updateSelectedAdressId(DeliveryAddress address) {
    if (address == null) {
      selectedAdressId.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      setAddress(address: address);
      selectedAdressId.sink.add(address.id);
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
