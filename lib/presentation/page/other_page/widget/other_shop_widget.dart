import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherShopWidget extends StatelessWidget {
  const OtherShopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: ScreenUtil().setWidth(343),
      height: ScreenUtil().setHeight(140),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(251, 228, 228, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(left: 16.0, top: 19, bottom: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mağazalar ",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                MySizedBox.h6,
                Container(
                  width: 165,
                  height: 72,
                  child: Text(
                    MyText.otherShop,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.sanF400Grey.copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
              height: 120.sp,
              width: 120.sp,
              child: Image.asset(Assets.shopMobile)),
          MySizedBox.w16
        ],
      ),
    );
  }
}
