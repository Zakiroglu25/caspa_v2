import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherShopWidget extends StatelessWidget {
  const OtherShopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => Go.to(context, Pager.shops),
      child: Container(
        padding: Paddings.paddingA20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(251, 228, 228, 1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 72 - 24) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyText.shops,
                    style: AppTextStyles.sanF600.copyWith(fontSize: 17.sm),
                  ),
                  MySizedBox.h6,
                  SizedBox(
                    width: 165.sp,
                    height: 75.sp,
                    child: Text(
                      MyText.otherShop,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.sanF400Grey.copyWith(
                          fontSize: 13.sm, height: 1.3, letterSpacing: 0.2),
                    ),
                  ),
                ],
              ),
            ),
            MySizedBox.w12,
            Container(
                height: 120.sp,
                width: (MediaQuery.of(context).size.width - 72 - 24) / 2,
                child: Image.asset(Assets.shopMobile)),
          ],
        ),
      ),
    );
  }
}
