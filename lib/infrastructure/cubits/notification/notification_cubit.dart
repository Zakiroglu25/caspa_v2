// Dart imports:
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/notification_provider.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'notification_state.dart';

// Project imports:

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  HiveService get _prefs => locator<HiveService>();
  //RenewTokenService get _token => locator<RenewTokenService>();

  void fetch({bool? loading, @required BuildContext? context}) async {
    if (loading ?? true) {
      emit(NotificationInProgress());
    }

    try {
      //   String token = await _token.reNewToken(context);
      String token = '';
      final result =
          await NotificationProvider.fetchNotificationData(token: token);

      if (result?.message == 'ok') {
        if (result?.result?.length == 0) {
          emit(NotificationNotFound());
        } else
          emit(NotificationSuccess(result));
      } else {
        emit(NotificationError());
      }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
    } catch (e) {
      emit(NotificationError());
    }
  }

  Future<bool> removeNotificion(
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
      if (result?.message == 'ok') {
        emit(NotificationRemoveSuccess());
        fetch(loading: false, context: context);
        return true;
      } else {
        emit(NotificationError());
        return false;
      }
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
      if (result?.message == 'ok') {
        emit(NotificationStatusUpdated());
      }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
    } catch (e) {
      emit(NotificationError());
    }
  }
}
