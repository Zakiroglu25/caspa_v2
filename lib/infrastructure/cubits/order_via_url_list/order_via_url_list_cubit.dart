import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/attorneys_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/order_via_link_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../locator.dart';
import '../../configs/recorder.dart';
import 'order_via_url_list_state.dart';

class OrderViaUrlListCubit extends Cubit<OrderViaUrlListState> {
  OrderViaUrlListCubit() : super(OrderViaUrlListInProgress());

  HiveService get _prefs => locator<HiveService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(OrderViaUrlListInProgress());
    }

    try {
      final result = await OrderViaLinkProvider.getOrders();
      if (result.data != null) {
        emit(OrderViaUrlListSuccess(result.data!));
      } else {
        emit(OrderViaUrlListError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(OrderViaUrlListNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OrderViaUrlListError(error: e.toString()));
    }
  }

  void delete(int? id, {bool loading = true}) async {
    if (loading) {
      emit(OrderViaUrlListInProgress());
    }

    try {
      final result = await AttorneyProvider.deleteAttorney(
          accessToken: _prefs.accessToken, id: id!);

      if (isSuccess(result!.statusCode)) {
        emit(OrderViaUrlListDeleted());
        fetch(false);
      } else {
        emit(OrderViaUrlListError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(OrderViaUrlListNetworkError());
    } catch (e) {
      emit(OrderViaUrlListError(error: MyText.error + " " + e.toString()));
    }

    //user/attorneys/delete
  }
}
