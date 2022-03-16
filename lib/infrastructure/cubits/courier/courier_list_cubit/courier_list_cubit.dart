import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/courier_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../../../../util/constants/text.dart';
import '../../../models/remote/response/courier_orders_model.dart';
import '../../../models/remote/response/packages_data.dart';
import '../../../services/hive_service.dart';
import 'courier_list_state.dart';

class CourierListCubit extends Cubit<CourierListState> {
  CourierListCubit() : super(CourierListInitial());

  HiveService get _prefs => locator<HiveService>();

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

  void delete(int? id, {bool loading = true}) async {
    if (loading) {
      emit(CourierListInProgress());
    }

    try {
      final result = await CourierProvider.deleteCourier(
          accessToken: _prefs.accessToken, id: id!);

      if (isSuccess(result!.statusCode)) {
        emit(CourierListDeleted());
        fetch(false);
      } else {
        emit(CourierListError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierListNetworkError());
    } catch (e) {
      emit(CourierListError(error: MyText.error + " " + e.toString()));
    }

    //user/attorneys/delete
  }
  void edit(
      BuildContext context, {
        required CourierOrder courierOrder,
        required List<Package> packages,
      }) async {
    emit(CourierListInProgress());
    try {
      final result = await CourierProvider.updateCourier(
        adress: courierOrder.address!,
        id: courierOrder.id!,
        packages: packages.map((e) => e.id!).toList(),
        phone: courierOrder.phone!,
        regionId: courierOrder.region!.id!,
      );

      if (isSuccess(result.statusCode)) {
        emit(CourierListEdit());
      } else {
        emit(CourierListError(error: MyText.error));
      }
    } on SocketException catch (_) {
      emit(CourierListError(error: 'network_error'));
    } catch (e) {
      print(e);
      emit(CourierListError(error: MyText.error + ": $e"));
    }
  }
}
