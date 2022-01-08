import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/caspa_appbar/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class SliverNotification extends StatelessWidget {

  bool? notification;

  SliverNotification(this.notification);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 6.5,
      child: WidgetOrEmpty(
        value: notification,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Container(
              height: 43,
              width: 43,
              child: Stack(
                children: [
                  NotificationWidget(),
                  // Positioned(
                  //     right: 7,top: 6,
                  //     child: SvgPicture.asset(Assets.svgEllipse))
                ],
              )),
        ),
      ),
    );
  }
}
