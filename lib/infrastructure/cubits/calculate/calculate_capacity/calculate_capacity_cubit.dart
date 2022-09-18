import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/calculate_provider.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'calculate_capacity_state.dart';

class CalculateCapacityCubit extends Cubit<CalculateCapacityState> {
  CalculateCapacityCubit() : super(CalculateCapacityInitial());

  void capacity(BuildContext context, [bool loading = true]) async {
    if (loading) {
      log("1 cubit");
      emit(CalculateCapacityInAdding());
    }
    try {
      log("2 cubit");
      final result = await CalculateKgProvider.capacity(
          length: lenght.valueOrNull,
          size: true,
          height: height.valueOrNull,
          width: width.valueOrNull);
      if (isSuccess(result.statusCode)) {
        emit(CalculateCapacityAdded(result.data));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CalculateCapacityNetworkError());
    } catch (e, s) {
      log("5cubit");
      eeee("Calculate Capacity cubit catch: $e => $s");
      emit(CalculateCapacityError(error: e.toString()));
    }
  }

//lenght
  final BehaviorSubject<String> lenght = BehaviorSubject<String>();

  Stream<String> get lenghtStream => lenght.stream;

  updateLenght(String value) {
    if (value == null || value.isEmpty) {
      lenght.value = '';
      lenght.sink.addError(MyText.field_is_not_correct);
    } else {
      lenght.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get islenghtIncorrect =>
      (!lenght.hasValue || lenght.value == null || lenght.value.isEmpty);

//width
  final BehaviorSubject<String> width = BehaviorSubject<String>();

  Stream<String> get widthStream => width.stream;

  updateWidth(String value) {
    if (value == null || value.isEmpty) {
      width.value = '';
      width.sink.addError(MyText.field_is_not_correct);
    } else {
      width.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get iswidthIncorrect =>
      (!width.hasValue || width.value == null || width.value.isEmpty);

//height
  final BehaviorSubject<String> height = BehaviorSubject<String>();

  Stream<String> get heightStream => height.stream;

  updateHeight(String value) {
    if (value == null || value.isEmpty) {
      height.value = '';
      height.sink.addError(MyText.field_is_not_correct);
    } else {
      height.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isheightIncorrect =>
      (!height.hasValue || height.value == null || height.value.isEmpty);

  //--------------------values:-----------------
  @override
  Future<void> closee() {
    lenght.close();
    width.close();
    height.close();
    return super.close();
  }
}
