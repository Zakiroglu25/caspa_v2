import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
      final result = await OrderHistoryProvider.gerOrderList();

      ///ama gelir burda resultu null goturur

      if (result != null) {
        emit(OrderHistorySuccess(result));
        log(result.toString());
      } else {
        emit(OrderHistoryError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(OrderHistoryError());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(OrderHistoryError());
    }
  }
}
