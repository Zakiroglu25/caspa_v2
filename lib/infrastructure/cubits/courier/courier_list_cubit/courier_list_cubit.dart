import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/courier_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'courier_list_state.dart';

class CourierListCubit extends Cubit<CourierListState> {
  CourierListCubit() : super(CourierListInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(CourierListInProgress());
    }
    try {
      log("1 cubit");
      final result = await CourierProvider.fetchCourier();

      if (isSuccess(result?.statusCode)) {
        log("2 cubit");
        emit(CourierListSuccess(result?.data));
      } else {
        log("3 cubit");
        emit(CourierListError());
        eeee(
            "login result bad: ${ResponseMessage.fromJson(jsonDecode(result!.data)).message}");
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierListNetworkError());
    } catch (e) {
      log("4 cubit");
      eeee("shop cubit catch: $e");
      emit(CourierListError(error: e.toString()));
    }
  }
}