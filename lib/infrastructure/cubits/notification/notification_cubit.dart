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
import '../../../util/delegate/request_control.dart';
import 'notification_state.dart';

// Project imports:

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  HiveService get _prefs => locator<HiveService>();
  //RenewTokenService get _token => locator<RenewTokenService>();

  void fetch({bool? loading}) async {
    if (loading ?? true) {
      emit(NotificationInProgress());
    }
    emit(NotificationInProgress());
    try {
      final result = await NotificationProvider.getNotification();
      // bbbb('noy: ${result.statusCode}');
      List<MyNotification> notificationList =
          result.data as List<MyNotification>;
      // notificationList.forEach((element) {});

      if (isSuccess(result.statusCode)) {
        emit(NotificationSuccess(notificationList));
        // bbbb("hjgkhjk; $notificationList");
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
      {int? notificationId,
      bool? loading,
      required BuildContext? context}) async {
    if (loading ?? true) {
      emit(NotificationInProgress());
    }

    try {
      // String token = await _token.reNewToken(context);
      String token = '';
      final result = await NotificationProvider.removeNotification(
          token: token, notificationId: notificationId);
      // if (result?.message == 'ok') {
      //   emit(NotificationRemoveSuccess());
      //   fetch(loading: false, context: context);
      //   return true;
      // } else {
      //   emit(NotificationError());
      //   return false;
      // }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
      return false;
    } catch (e) {
      emit(NotificationError());
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
