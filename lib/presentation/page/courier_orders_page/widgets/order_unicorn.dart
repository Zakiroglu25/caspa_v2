import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';

import 'order_price_info.dart';

class OrderUnicorn extends StatelessWidget {
  final String? sellerName;
  final String? trackingCode;
  final String? price;
  final String? title;
  final String? deliveryPrice;
  final int? statusId;
  OrderUnicorn(
      {this.sellerName,
      this.trackingCode,
      this.statusId,
      this.title,
      this.deliveryPrice,
      this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionName(title: title ?? ""),
        MySizedBox.h16,
        UnicornOutlineButton(
          strokeWidth: 1.5,
          radius: 16,
          padding: Paddings.paddingH20 + Paddings.paddingV14,
          gradient: LinearGradient(colors: [
            MyColors.gradientBlue,
            MyColors.gradientCyan,
            MyColors.gradientRed,
            MyColors.gradientOrange,
          ]),
          child: Container(
            //width: 200,
            child: Column(
              children: [
                ProductPropertyV(
                    h: 8, name: MyText.shop_name, value: sellerName),
                ProductPropertyV(
                    h: 8, name: MyText.tracking_id, value: trackingCode),
                ProductPropertyV(
                    h: 8, name: MyText.price, value: "$price ${MyText.tryy}"),
                OrderPriceInfo(
                  statusId: statusId,
                  deliveryPrice: "$deliveryPrice ${MyText.usd}",
                ),
              ],
            ),
          ),
          onPressed: () {},
        ),
        MySizedBox.h20,
      ],
    );
  }
}
