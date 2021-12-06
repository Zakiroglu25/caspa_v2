// Flutter imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/gradients.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget_or_empty.dart';
// Project imports:

class Alert {
  static show(BuildContext context,
      {Widget? image, String? title, String? content,

      Fi
      }) {
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
                        child: Image.asset('assets/png/sucs.png'),
                        height: 120.sm,
                        width: 120.sm,
                      ),
                  SizedBox(
                    height: 10.sm,
                  ),
                  Text(
                    MyText.congrated,
                    style: AppTextStyles.sanF600.copyWith(fontSize: 16.sm),
                  ),
                  SizedBox(
                    height: 10.sm,
                  ),
                  Text(
                 content??   MyText.operationIsSuccess,
                    style: AppTextStyles.sanF400
                        .copyWith(fontSize: 14.sm, color: MyColors.grey163),
                  ),
                  SizedBox(
                    height: 18.sm,
                  ),
                  CaspaButton(
                    text: MyText.ok,
                  )
                ],
              ),
            ),
          );
        });
  }
}
