// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/models/local/my_user.dart';

class NotificationElement extends StatefulWidget {
  // final String? title;
  // final String? content;
  final Function? onXTap;
  final bool? increase;
  MyNotification notification;
  NotificationElement({
    // required this.title,
    // required this.content,
    required this.onXTap,
    required this.notification,
    this.increase,
  });

  @override
  _NotificationElementState createState() => _NotificationElementState();
}

class _NotificationElementState extends State<NotificationElement>
    with SingleTickerProviderStateMixin {
  DateTime? date;
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      manualTrigger: false,
      duration: Duration(milliseconds: 400),
      controller: (acontroller) {
        controller = acontroller;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              StringOperations.dateConvertFromString(
                  widget.notification.createdAt!, context),
              style: const TextStyle(
                  color: MyColors.grey163, fontWeight: FontWeight.w700)),
          MySizedBox.h10,
          Container(
            // height: 76,

            padding: Paddings.paddingA16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.notification.title!,
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 16, color: MyColors.black34),
                ),
                MySizedBox.h4,
                Text(
                  widget.notification.description!,
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 12, color: MyColors.grey153),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: (widget.notification.read == 0)
                    ? MyColors.grey245
                    : Colors.amberAccent,
                //color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
    );
  }
}
