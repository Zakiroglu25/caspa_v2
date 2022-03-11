import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_price_info.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';

class CourierUnicorn extends StatelessWidget {
  final Data couriers;

  CourierUnicorn({required this.couriers});

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      strokeWidth: 1.5,
      radius: 16,
      padding: Paddings.paddingH20 + Paddings.paddingV14,
      gradient: LinearGradient(colors: [
        MyColors.gradientBlue.withOpacity(.5),
        MyColors.gradientCyan.withOpacity(.5),
        MyColors.gradientRed.withOpacity(.5),
        MyColors.gradientOrange.withOpacity(.5),
      ]),
      onPressed: () {},
      child: Stack(
        children: [
          Container(
            height: 135.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SectionName(
                  title: "${couriers.products}",
                  size: 16.sm,
                ),
                Text("${couriers.region!.name}",
                    style: AppTextStyles.sanF400
                        .copyWith(color: MyColors.grey153)),
                Text("${couriers.updateDate}",
                    style: AppTextStyles.sanF400
                        .copyWith(color: MyColors.grey153)),
                if (couriers.payment == 0)
                  Text("Ödənilməlidir",
                      style: AppTextStyles.sanF400
                          .copyWith(color: MyColors.orange)),
                if (couriers.payment == 1)
                  Text("Ödənilib",
                      style: AppTextStyles.sanF400
                          .copyWith(color: MyColors.green)),
                if (couriers.payment == 2)
                  Text("Təhvil verildi",
                      style: AppTextStyles.sanF400
                          .copyWith(color: MyColors.mainBlue)),
              ],
            ),
          ),
          if (couriers.payment == 0)
            Positioned(
              right: 0,
              bottom: 0,
              child: CaspaButton(
                h: 44.sp,
                w: 135.sp,
                color: MyColors.black,
                textColor: MyColors.white,
                borderRadius: 12,
                textSize: 14.sm,
                text: MyText.pay + " " + "${couriers.price} AZN",
              ),
            ),
        ],
      ),
      // onPressed: () {
      //   if(shop.link!=null){
      //     launch(shop.link!);
      //   }
      //   else{
      //     Snack.display(context: context,message: MyText.error,positive: false);
      //
      //   }
      // },
    );
  }
}
