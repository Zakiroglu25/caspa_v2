// Dart imports:

// Package imports:

import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';

class CourierCubit extends Cubit<CourierState> {
  CourierCubit() : super(CourierInitial()) {
    selectedOrders.addListener(() {
      isDataValid();
    });
  }

  PreferencesService get _prefs => locator<PreferencesService>();

  // List<int> selectedOrders = [];
  ValueNotifier<List<int>> selectedOrders = ValueNotifier<List<int>>([]);

  ///////uEmail
  bool emailValid = false;
  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  updateEmail(String value) {
    if (value == null || value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError("email_address_is_not_correct");
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
  }

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

  ///////uCode
  final BehaviorSubject<String> uCode = BehaviorSubject<String>();

  Stream<String> get codeStream => uCode.stream;

  updateCode(String value) {
    if (value == null || value.isEmpty) {
      uCode.value = '';
      uCode.sink.addError("fill_correctly");
    } else {
      uCode.sink.add(value);
    }
  }

  bool get isCodeIncorrect =>
      (!uCode.hasValue || uCode.value == null || uCode.value.isEmpty);

  ///////////////////

  addOrderId(int id) {
    if (selectedOrders.value.contains(id)) {
      selectedOrders.value.remove(id);
    } else {
      selectedOrders.value.add(id);
    }

    isDataValid();
    bbbb("selected order list in cubit : ${selectedOrders.value}");
  }

  bool isDataValid() {
    if (selectedOrders.value.length != 0) {
      emit(CourierContinueButtonActive());
      return false;
    } else
      emit(CourierContinueButtonPassive());
    return true;
  }

  void fetchPackagesForCourier([bool loading = true]) async {
    if (loading) {
      emit(CourierInProgress());
    }

    try {
      final result = await PackageProvider.fetchPackagesForCourier();
      if (isSuccess(result.statusCode)) {
        emit(CourierableFetched(result.data));
      } else {
        emit(CourierError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierError());
    } catch (e, s) {
      eeee("fetchPackagesForCourier catch: $e => $s");
      emit(CourierError(error: e.toString()));
    }
  }

  ////////////////////////////fields

  //adress
  final BehaviorSubject<String> adress = BehaviorSubject<String>();

  Stream<String> get adressStream => adress.stream;

  updateAdress(String value) {
    if (value == null || value.isEmpty) {
      adress.value = '';
      adress.sink.addError(MyText.field_is_not_correct);
    } else if (value.length < 10) {
      adress.sink.addError(MyText.adress_minumum_10);
    } else {
      adress.sink.add(value);
    }
  }

  bool get isAdressIncorrect =>
      (!adress.hasValue || adress.value == null || adress.value.isEmpty);

  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value == null || value.isEmpty) {
      phone.value = '';
      phone.sink.addError(MyText.field_is_not_correct);
    } else {
      phone.sink.add(value);
    }
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  //region
  final BehaviorSubject<String> region = BehaviorSubject<String>();

  Stream<String> get regionStream => region.stream;

  updateRegion(String value) {
    if (value == null || value.isEmpty) {
      region.value = '';
      region.sink.addError(MyText.field_is_not_correct);
    } else {
      region.sink.add(value);
    }
  }

  bool get isRegionIncorrect =>
      (!region.hasValue || region.value == null || region.value.isEmpty);

  @override
  Future<void> close() {
    uEmail.close();
    uCode.close();
    return super.close();
  }
}
