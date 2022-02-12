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
//   void capacity(BuildContext context, [bool loading = true]) async {
//     if (loading) {
//       log("1");
//       emit(CalculateKgInAdding());
//     }
//     try {
//       log("2");
//       final result = await CalculateKgProvider.capacity(
//           lenght: lenght.valueOrNull!,
//           size: true,
//           height: height.valueOrNull,
//           width: width.valueOrNull!);
//       if (result != null) {
//         emit(CalculateKgAdded(result.data));
//       }
//     } on SocketException catch (_) {
//       //network olacaq
//       emit(CalculateKgNetworkError());
//     } catch (e, s) {
//       log("5");
//       eeee("CalculateKg cubit catch: $e => $s");
//       emit(CalculateKgError(error: e.toString()));
//     }
//   }
//
// //lenght
//   final BehaviorSubject<String> lenght = BehaviorSubject<String>();
//
//   Stream<String> get lenghtStream => kg.stream;
//
//   updateLenght(String value) {
//     if (value == null || value.isEmpty) {
//       lenght.value = '';
//       lenght.sink.addError(MyText.field_is_not_correct);
//     } else {
//       lenght.sink.add(value);
//     }
//     // isUserInfoValid(registerType: _registerType);
//   }
//
//   bool get islenghtIncorrect =>
//       (!lenght.hasValue || lenght.value == null || lenght.value.isEmpty);
//
// //width
//   final BehaviorSubject<String> width = BehaviorSubject<String>();
//
//   Stream<String> get widthStream => width.stream;
//
//   updateWidth(String value) {
//     if (value == null || value.isEmpty) {
//       width.value = '';
//       width.sink.addError(MyText.field_is_not_correct);
//     } else {
//       width.sink.add(value);
//     }
//     // isUserInfoValid(registerType: _registerType);
//   }
//
//   bool get iswidthIncorrect =>
//       (!width.hasValue || width.value == null || width.value.isEmpty);
//
// //height
//   final BehaviorSubject<String> height = BehaviorSubject<String>();
//
//   Stream<String> get heightStream => height.stream;
//
//   updateHeight(String value) {
//     if (value == null || value.isEmpty) {
//       height.value = '';
//       height.sink.addError(MyText.field_is_not_correct);
//     } else {
//       height.sink.add(value);
//     }
//     // isUserInfoValid(registerType: _registerType);
//   }
//
//   bool get isheightIncorrect =>
//       (!height.hasValue || height.value == null || height.value.isEmpty);
//
//   //--------------------values:-----------------
//   @override
//   Future<void> closee() {
//     lenght.close();
//     width.close();
//     height.close();
//     return super.close();
//   }
}
