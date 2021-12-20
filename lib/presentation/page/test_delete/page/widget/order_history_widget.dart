import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistoryWidget extends StatelessWidget {
  late String? deliveryDate;
  late String? clientName;
  late String? deliveryStatus;
  late String? totalPrice;
  late String? deliveryTimeFrom;
  late String? deliveryTimeTo;
  late int? id;
  OrderHistoryWidget(
      {this.deliveryDate,
      this.clientName,
      this.deliveryStatus,
      this.totalPrice,
      this.deliveryTimeFrom,
      this.deliveryTimeTo,
      this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: MyColors.white),
        child: Column(
          children: [
            MySizedBox.h16,
            Text(
              deliveryDate!,
              style: AppTextStyles.coHead400
                  .copyWith(fontSize: 15.sp, color: MyColors.textBlack),
            ),
            Row(
              children: [
                MySizedBox.w16,
                Container(
                  width: 20.sp,
                  height: 20.sp,
                  decoration: BoxDecoration(
                    color: MyColors.textBlack,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    "1",
                    style: AppTextStyles.coHead400
                        .copyWith(color: MyColors.white),
                  )),
                ),
                MySizedBox.w12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySizedBox.h20,
                    Row(
                      children: [
                        Text(
                          "$clientName"+"-"+"ID:$id",
                          style: AppTextStyles.coHead400.copyWith(
                              fontSize: 13.sp, color: MyColors.textBlack),
                        )
                      ],
                    ),
                    MySizedBox.h4,
                    Text(
                      clientName!,
                      style: AppTextStyles.coHead400
                          .copyWith(fontSize: 17.sp, color: MyColors.textBlack),
                    ),
                    MySizedBox.h4,
                    Row(
                      children: [
                        Text(
                          "${totalPrice!} / ${deliveryTimeFrom!} - ${deliveryTimeTo!}",
                          style: AppTextStyles.coHead400.copyWith(
                              fontSize: 13.sp, color: MyColors.textBlack),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                SvgPicture.asset(Assets.svgCheck),
                MySizedBox.w16,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
