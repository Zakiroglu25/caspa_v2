import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/wheel_provider.dart';
import 'package:caspa_v2/util/extensions/int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../util/delegate/my_printer.dart';
import '../../services/hive_service.dart';
import 'wheel_state.dart';

class WheelCubit extends Cubit<WheelState> {
  WheelCubit() : super(WheelInitial());

  HiveService get _prefs => locator<HiveService>();
  void fetch([bool loading = true, BuildContext? context]) async {
    if (loading) {
      emit(WheelInProgress());
    }
    try {
      final response = await WheelProvider.fetch();
      if (response!.statusCode.isSuccess) {
        final user = _prefs.user..wheel_active = false;
        _prefs.persistUser(user: user);
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
