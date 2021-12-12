import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/notification_body.dart';
import 'widgets/notification_cancel_button.dart';



class NotificationPopUp extends StatelessWidget {
  NotificationPopUp({
    required this.cancel,
    required this.title,
    required this.content,
    required this.data,
  });

  final Function cancel;
  final String title;
  final String content;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: () {
          cancel.call();
          // print("GlobalKey<NavigatorState>>().currentContext: "+GlobalKey<NavigatorState>.currentContext.toString());
          //GeneralOperations.determineTab(data);
        },
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 2,
          color: MyColors.white.withOpacity(.95),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                NotificationBody(
                  title: title,
                  content: content,
                ),
                NotificationCancelButton(cancel)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
