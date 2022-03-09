import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/contact_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/delegate/request_control.dart';
import '../../configs/recorder.dart';
import '../../data_source/notification_provider.dart';
import '../../models/local/my_user.dart';
import 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  NotificationListCubit() : super(NotificationListInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(NotificationListInProgress());
    }
    try {
      final result = await NotificationProvider.getNotification();
      bbbb('noy: ${result.statusCode}');
      List<MyNotification> notificationList =
          result.data as List<MyNotification>;
      // notificationList.forEach((element) {});

      if (isSuccess(result.statusCode)) {
        emit(NotificationSuccess(notificationList));
        bbbb("hjgkhjk; $notificationList");
      } else {
        emit(NotificationListError());
      }
    } on SocketException catch (_) {
      emit(NotificationListError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(NotificationListError());
    }
  }
}
