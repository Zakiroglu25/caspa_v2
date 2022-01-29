// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

class NotificationElement extends StatefulWidget {
  final String? title;
  final String? content;
  final Function? onXTap;
  final bool? increase;

  NotificationElement({
    required this.title,
    required this.content,
    required this.onXTap,
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
      child: Container(
        height: 76,
        padding: Paddings.paddingH16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title!,
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 16, color: MyColors.black34),
                ),
                MySizedBox.h4,
                Text(
                  widget.content!,
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 12, color: MyColors.grey153),
                ),
              ],
            ),
            SizedBox(
              width: 100,
              child: FittedBox(
                child: Text(
                  "+4.00 USD",
                  style: AppTextStyles.sanF600.copyWith(
                      fontSize: 16,
                      color: (widget.increase ?? false)
                          ? MyColors.errorRED
                          : MyColors.green),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: (widget.increase ?? false)
                ? MyColors.grey245
                : Colors.transparent,
            //color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
