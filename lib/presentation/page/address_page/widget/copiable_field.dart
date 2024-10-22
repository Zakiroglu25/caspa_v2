import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/general/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CopiableField extends StatelessWidget {
  String? title;
  String? data;
  String? copyText;
  int? maxLines = 1;

  CopiableField(
      {required this.title, required this.data, this.copyText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizedBox.h8,
          GestureDetector(
            onTap: () => StringOperations.copy(data!, context),
            child: Container(
              //height: 72 + (((maxLines ?? 1) - 1) * 20.0),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title ?? "",
                            style: AppTextStyles.sanF600
                                .copyWith(fontSize: 14.sp, letterSpacing: 0.3)),
                        MySizedBox.h2,
                        Text(
                          data ?? "",
                          //  overflow: TextOverflow.ellipsis,
                          //maxLines: maxLines ?? 1,
                          style: TextStyle(
                              color: MyColors.grey153,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  MySizedBox.w10,
                  CopyButton(
                    data,
                    color: MyColors.mainColor,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
