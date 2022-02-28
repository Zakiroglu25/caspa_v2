// Flutter imports:
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/widget/main/notification_popup/notification_popup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ForegroundNotification {
  static show(RemoteMessage? event) async {
    BotToast.showCustomNotification(
      toastBuilder: (_) {
        return ElasticInDown(
            child: NotificationPopUp(
          cancel: _,
          title: event!.notification!.title!,
          content: (event.notification!.body)!,
          data: event.data,
        ));
      },
      duration: Duration(seconds: 10),
    );

    AwesomeNotifications().createNotification(
        content: NotificationContent(
            color: MyColors.mainColor,
            id: Random.secure().nextInt(999),
            displayOnBackground: true,
            channelKey: 'basic_channel',
            title: (event!.notification!.title)!,
            showWhen: true,
            body: event.notification!.body));
  }
}
