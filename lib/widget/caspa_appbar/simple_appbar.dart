// Flutter imports:

import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_detector/focus_detector.dart';

import 'widgets/notification_widget.dart';

class CaspaAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? back;
  final bool? notification;
  final bool? exitButton;
  final BuildContext? contextA;
  final bool? centerTitle;

  CaspaAppbar(
      {@required this.title,
      @required this.back,
      this.notification,
      this.exitButton,
      @required this.contextA,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        if (notification ?? true) {
          //  context.read<HeaderCubit>()..fetch();
        }
      },
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                (back ?? false)
                    ? Material(
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: MyColors.mainOrange,
                            )),
                      )
                    : WidgetOrEmpty(
                        value: notification,
                        child: Container(
                          width: 43,
                        )),
              ],
            ),
            Center(
              child: Text(
                title!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: MyColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            rightButtonsRow(context),
          ],
        ),
      ),
    );
  }

  Row rightButtonsRow(BuildContext contextZ) {
    return Row(
      children: [
        (notification ?? true) ? NotificationWidget() : Container(),
        MySizedBox.w8
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
