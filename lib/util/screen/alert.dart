// Flutter imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/gradients.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget_or_empty.dart';
// Project imports:

class Alert {
  static show(BuildContext context,
      {Widget? image,
      Widget? secondButton,
      String? title,
      String? buttonText,
      String? content,
      Function? onTap}) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: MyColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            insetPadding: Paddings.zero,
            content: Container(
              width: MediaQuery.of(context).size.width - 32,
              padding: Paddings.paddingA16,
              // color: MyColors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  image ??
                      Container(
                        child: SvgPicture.asset(Assets.svgInfoApp),
                        height: 120.sm,
                        width: 120.sm,
                      ),
                  SizedBox(
                    height: 10.sm,
                  ),
                  Text(
                    title ?? MyText.congrated,
                    style: AppTextStyles.sanF600.copyWith(fontSize: 18.sm),
                  ),
                  SizedBox(
                    height: 10.sm,
                  ),
                  Padding(
                    padding: Paddings.paddingH16,
                    child: Text(
                      content ?? MyText.operationIsSuccess,
                      style: AppTextStyles.sanF400
                          .copyWith(fontSize: 16.sm, color: MyColors.grey163),
                    ),
                  ),
                  SizedBox(
                    height: 18.sm,
                  ),
                  secondButton ?? Container(),
                  SizedBox(
                    height: 18.sm,
                  ),
                  CaspaButton(
                    text: buttonText ?? MyText.ok,
                    onTap: () {
                      if (onTap != null) {
                        onTap.call();
                      }
                      Go.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
