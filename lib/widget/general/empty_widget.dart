import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sad_face_anim.dart';
import 'sad_smile.dart';

class EmptyWidget extends StatelessWidget {
  final bool? smile;

  final text;

  EmptyWidget({this.smile, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.sp,
                width: 120.sp,
                child: WidgetOrEmpty(
                  value: smile,
                  child: SadSmile(),
                  // elseChild:
                  elseChild: SadFaceAnim(),
                ),
              ),
              SizedBox(
                height: 16.sp,
              ),
              Text(
                text != null ? text: MyText.no_result,
                style: AppTextStyles.coHead400.copyWith(fontSize: 25.sp,
                    color: MyColors.black126),
              )
            ],
          )),
    );
  }
}