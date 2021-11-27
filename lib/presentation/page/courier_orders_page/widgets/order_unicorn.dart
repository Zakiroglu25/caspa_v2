import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_price_info.dart';

class OrderUnicorn extends StatelessWidget {
  final String? sellerName;
  final String? trackingCode;
  final String? price;
  final String? deliveryPrice;
  final int? statusId;

  OrderUnicorn(
      {this.sellerName,
      this.trackingCode,
      this.statusId,
      this.deliveryPrice,
      this.price});

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      strokeWidth: 1.5,
      radius: 16,
      padding: Paddings.paddingH20 + Paddings.paddingV20,
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
            ProductPropertyV(h: 8, name: "Mağaza", value: sellerName),
            ProductPropertyV(h: 8, name: "İzləmə kodu", value: trackingCode),
            ProductPropertyV(h: 8, name: "Qiymət", value: price),
            OrderPriceInfo(
              statusId: statusId,
              deliveryPrice: '233.44',
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}
