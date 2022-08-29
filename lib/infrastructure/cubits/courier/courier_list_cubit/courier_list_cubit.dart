import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/courier_provider.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../data_source/package_provider.dart';
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
      final result = await CourierProvider.fetchCourier();
      final resultPackages = await PackageProvider.fetchPackagesForCourier();
      if (isSuccess(result?.statusCode)) {
        emit(CourierListSuccess(
            courierList: result!.data, packageList: resultPackages.data));
      } else {
        emit(CourierListError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierListNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s, where: 'CourierListCubit.fetch');
      emit(CourierListError(error: MyText.error));
    }
  }

  void delete(
    BuildContext context,
    int? id, {
    bool loading = true,
  }) async {
    if (loading) {
      emit(CourierListInEditing());
    }

    try {
      final result = await CourierProvider.deleteCourier(
          accessToken: _prefs.accessToken, id: id!);

      if (isSuccess(result!.statusCode)) {
        //emit(CourierListDeleted());
        Snack.positive(message: MyText.operationIsSuccess);
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
    Go.pop(context);

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
        id: courierOrder.id!,
        adress: courierOrder.address!,
        phone: courierOrder.phone!,
        regionId: courierOrder.region!.id!,
        packages: packages.map((e) => e.id!).toList(),
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
