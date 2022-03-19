import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';

import 'full_screen_alert.dart';
import 'widget_or_empty.dart';

class FullScreenLoading {
  static BuildContext? context;
  static String? text;

  static void display(BuildContext context,
      {String? text, bool autoHide = false}) {
    FullScreenAlert.of(context).show(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetOrEmpty(value: text != null, child: Spacer()),
            CaspaLoading(
              color: MyColors.mainColor,
            ),
            MySizedBox.h30,
            WidgetOrEmpty(value: text != null, child: Spacer()),
            WidgetOrEmpty(
                value: text != null,
                child: Flash(
                  infinite: true,
                  duration: Duration(seconds: 4),
                  child: Text(
                    text ?? "lading...",
                    style: AppTextStyles.coHead400.copyWith(
                      color: MyColors.mainColor,
                      fontSize: 13,
                    ),
                  ),
                )),
            WidgetOrEmpty(
              value: text != null,
              child: MySizedBox.h0,
            ),
          ],
        ),
        hideAuto: autoHide,
        backColor: MyColors.white70);
  }

  static void hide(BuildContext context, {String? text}) {
    FullScreenAlert.of(context).hideAlert();
  }
}
