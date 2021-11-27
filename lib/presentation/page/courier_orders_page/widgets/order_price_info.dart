import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPriceInfo extends StatelessWidget {

  final String ? deliveryPrice;
  final int ? statusId;


  OrderPriceInfo({this.deliveryPrice, this.statusId});

  @override
  Widget build(BuildContext context) {
    return             Container(
      width: double.maxFinite,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: WidgetOrEmpty(
                value: statusId==2,
                child: ProductPropertyV(
                  h: 8,
                  name: "Çatdırılma xidməti",
                  value: deliveryPrice,
                  mainColor:  MyColors.green,
                ), elseChild: ProductPropertyV(
                  h: 8,
                  name: "Çatdırılma xidməti",
                  value: deliveryPrice,
                  mainColor:  MyColors.errorRED,
                ),
              )),
          Container(
            width: 91.sm,
            height: 44.sm,
            child: CaspaButton(
              color: MyColors.black,
              textColor: MyColors.white,
              borderRadius: 12,
              textSize: 14.sm,
              text: MyText.pay,
            ),
          ),
        ],
      ),
    );
  }
}
