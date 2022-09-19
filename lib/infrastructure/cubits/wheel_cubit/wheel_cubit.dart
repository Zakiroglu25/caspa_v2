import 'dart:async';
import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../presentation/page/whell_page/well_win_page.dart';
import '../../../presentation/page/whell_page/wheel_error_page.dart';
import '../../../util/delegate/my_printer.dart';
import '../../../util/delegate/request_control.dart';
import '../../data_source/public_provider.dart';
import '../../data_source/wheel_provider.dart';
import '../../services/hive_service.dart';
import 'wheel_state.dart';

class WheelCubit extends Cubit<WheelState> {
  WheelCubit() : super(WheelInitial());

  void fetch([bool loading = true, BuildContext? context]) async {
    wtf("Cubit1");
    if (loading) {
      emit(WheelInProgress());
    }
    wtf("Cubit2");
    try {
      wtf("Cubit2,5");
      final response = await WheelProvider.fetch();
      wtf("Cubit3" + response.toString() + response!.statusCode.toString());
      if (isSuccess(response.statusCode)) {
        wtf("Cubit4");
        emit(WheelSuccess(response.data));
      } else {
        wtf("Cubit5 Error");
        emit(WheelError(error: "Error status code: ${response.statusCode}"));
      }
    } on SocketException catch (_) {
      //network olacaq
      wtf("Cubit6 Error");
      emit(WheelNetworkError());
    } catch (e) {
      wtf("Cubit7 Error");
      eeee("WhellCubit -> fetch error: $e");
      emit(WheelError(error: e.toString()));
    }
  }
}
