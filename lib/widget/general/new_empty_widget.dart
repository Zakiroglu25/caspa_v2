import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewEmptyWidget extends StatelessWidget {
  final bool? smile;

  final String? text;
  final String? description;
  final Widget? button;
  final String? image;

  NewEmptyWidget(
      {this.smile, this.text, this.description, this.button, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: Paddings.paddingA12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null)
              Container(
                height: 120.sp,
                width: 120.sp,
                child: Image.asset(image!),
              ),
            SizedBox(
              height: 16.sp,
            ),
            Text(
              text ?? MyText.no_result,
              textAlign: TextAlign.center,
              style: AppTextStyles.coHead400.copyWith(
                  fontSize: 25.sp, height: 1.2, color: MyColors.black126),
            ),
            MySizedBox.h16,
            WidgetOrEmpty(
              value: description != null,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Text(description ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.sanF400.copyWith(
                        color: MyColors.grey153,
                        letterSpacing: 0.3,
                        height: 1.3)),
              ),
            ),
            AppButton(
              child: Text("Salam"),
            ),
          ],
        ),
      ),
    );
  }
}
