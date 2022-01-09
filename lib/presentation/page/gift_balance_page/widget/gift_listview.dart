import 'package:caspa_v2/infrastructure/models/remote/response/gift_model.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftList extends StatelessWidget {
   final List<Data> giftList;
   GiftList({required this.giftList});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: MediaQuery
          .of(context)
          .size
          .height / 2,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: false,
        itemCount: giftList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${giftList[index].code}",
                  style: AppTextStyles.sanF400.copyWith(
                      fontSize: 16.sp, color: MyColors.grey153),
                ),
                // Container(
                //   width: 75.sp,
                //   height: 48.sp,
                //   child: Text(
                //     "hList[index].date!.toString()",
                //     style: AppTextStyles.sanF400.copyWith(
                //         fontSize: 16.sp, color: MyColors.grey153),
                //   ),
                // ),
                if(giftList[index].code!.length > 0)
                Text(
                  "Bəli",
                  style: AppTextStyles.sanF400.copyWith(
                      fontSize: 16.sp, color: MyColors.grey153),
                ),
                // Spacer(),
                // Text(
                //   "hList[index].balance!.toString()",
                //   style: AppTextStyles.sanF400.copyWith(
                //       fontSize: 16.sp, color: MyColors.grey153),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
