import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/calculate_provider.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'calculate_state.dart';

class CalculateKgCubit extends Cubit<CalculateKgState> {
  CalculateKgCubit() : super(CalculateKgInitial());

  void addKg(BuildContext context, [bool loading = true]) async {
    if (loading) {
      emit(CalculateKgInAdding());
    }
    try {
      final result = await CalculateKgProvider.addKg(kg: kg.valueOrNull!);
      if (result != null) {
        emit(CalculateKgAdded(result.data));

      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CalculateKgNetworkError());
    } catch (e, s) {
      eeee("CalculateKg cubit catch: $e => $s");
      emit(CalculateKgError(error: e.toString()));
    }
  }

  ///kg
  final BehaviorSubject<String> kg = BehaviorSubject<String>();

  Stream<String> get kgStream => kg.stream;

  updateKg(String value) {
    if (value == null || value.isEmpty) {
      kg.value = '';
      kg.sink.addError(MyText.field_is_not_correct);
    } else {
      kg.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get iscalculateIncorrect =>
      (!kg.hasValue || kg.value == null || kg.value.isEmpty);

  //--------------------values:-----------------
  @override
  Future<void> close() {
    kg.close();

    return super.close();
  }

}