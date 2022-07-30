import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import 'notification_content.dart';
import 'notification_icon.dart';
import 'notification_title.dart';

class NotificationBody extends StatelessWidget {
  final String? title;
  final String? content;

  NotificationBody({required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 8, top: 8),
      child: Container(
        height: 75,

        width: double.maxFinite,
        // color: MyColors.mainRED,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NotificationIcon(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 20, left: 15, top: 0),
                height: 60,
                //   width: double.maxFinite - 66,
                //color: Colors.red,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NotificationTitle(title!),
                    MySizedBox.h5,
                    NotificationContent(content ?? ""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
