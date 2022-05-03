// Dart imports:
import 'dart:io';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/notification_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../util/constants/text.dart';
import '../../../util/delegate/request_control.dart';
import '../../../util/screen/snack.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  HiveService get _prefs => locator<HiveService>();

  void fetch({bool? loading}) async {
    if (loading ?? true) {
      emit(NotificationInProgress());
    }
    try {
      final result = await NotificationProvider.getNotification();
      List<MyNotification> notificationList =
      result.data as List<MyNotification>;
      if (isSuccess(result.statusCode)) {
        emit(NotificationSuccess(notificationList));
      } else {
        emit(NotificationError());
      }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(NotificationError());
    }
  }

  Future<bool?> removeNotificion(
      {required int notificationId,
        bool? loading,
        required BuildContext? context}) async {
    if (loading ?? true) {
      emit(NotificationInProgress());
    }

    try {
      final result = await NotificationProvider.removeNotification(
          notificationId: notificationId);
      if (isSuccess(result!.statusCode)) {
        Snack.positive(message: MyText.operationIsSuccess);
        fetch(loading: false);
      } else {
        emit(NotificationError());
      }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
      return false;
    } catch (e, s) {
      emit(NotificationError());
      Recorder.recordCatchError(e, s);
      return false;
    }
  }

  void updateNotificionStatus({bool? loading}) async {
    try {
      var result = await NotificationProvider.updateNotificationHeader(
          userId: _prefs.language);
      // if (result?.message == 'ok') {
      //   emit(NotificationStatusUpdated());
      // }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
    } catch (e) {
      emit(NotificationError());
    }
  }
}