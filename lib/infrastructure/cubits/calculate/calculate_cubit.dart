import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/calculate_provider.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'calculate_state.dart';

class CalculateKgCubit extends Cubit<CalculateKgState> {
  CalculateKgCubit() : super(CalculateKgInitial());

  void addKg(BuildContext context, [bool loading = true]) async {
    double weight = double.parse(kg.valueOrNull!);
    if (loading) {
      emit(CalculateKgInAdding());
    }
    try {
      final result = await CalculateKgProvider.addKg(kg: kg.valueOrNull!);
      if (isSuccess(result.statusCode)) {
        double resultKg;
        if (weight >= 1) {
          resultKg = weight * double.parse(result.data.price);
        } else {
          resultKg = double.parse(result.data.price);
        }
        emit(CalculateKgAdded(resultKg.toStringAsFixed(2)));
      }
    } on SocketException catch (_) {
      emit(CalculateKgNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s, where: 'CalculateKgCubit.addKg');
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
