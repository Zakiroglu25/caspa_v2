import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/delegate/my_printer.dart';
import '../../../util/delegate/request_control.dart';
import 'whell_state.dart';

class WheelCubit extends Cubit<WheelState> {
  WheelCubit() : super(WheelInitial());


  void fetch([bool loading = true,BuildContext? context]) async {
    if (loading) {
      emit(WheelInProgress());
    }
    try {
      final response = await GeneralProvider.wheel();
      if (isSuccess(response!.statusCode)) {
        emit(WheelSuccess(response.data));
      } else {
        emit(WheelError(error: "Error status code: ${response.statusCode}"));

      }
    } on SocketException catch (_) {
      emit(WheelNetworkError());
    } catch (e) {
      eeee("WhellCubit -> fetch error: $e");
      emit(WheelError(error: e.toString()));
    }
  }
}
