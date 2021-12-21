import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../order_history_provider.dart';
import 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(OrderHistoryProgress());
    }
    try {
      log("1");
      final result = await OrderHistoryProvider.gerOrderList();
      log("2");
      ///ama gelir burda resultu null goturur

      if (result != null) {
        log("3");
        emit(OrderHistorySuccess(result));
        log(result.toString());
        log("4");
      } else {
        log("5 Error");
        emit(OrderHistoryError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(OrderHistoryError());
    } catch (e) {
      log("6");
      if (kDebugMode) {
        print(e);
      }
      emit(OrderHistoryError());
    }
  }
}
