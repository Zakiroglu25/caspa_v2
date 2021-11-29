// Dart imports:

// Package imports:

import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';

class CourierCubit extends Cubit<CourierState> {
  CourierCubit() : super(CourierInitial()){
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
    if (selectedOrders.value .contains(id)) {
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

  @override
  Future<void> close() {
    uEmail.close();
    uCode.close();
    return super.close();
  }
}
