import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPriceInfo extends StatelessWidget {
  final String? deliveryPrice;
  final int? statusId;

  OrderPriceInfo({this.deliveryPrice, this.statusId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              //color: MyColors.mainRED,
              width: MediaQuery.of(context).size.width / 2,
              child: WidgetOrEmpty(
                value: statusId == 1,
                child: ProductPropertyV(
                  h: 8,
                  name: MyText.deliveryPrice,
                  value: deliveryPrice! + " - " + MyText.paid,
                  mainColor: MyColors.green,
                ),
                elseChild: ProductPropertyV(
                  h: 8,
                  name: MyText.deliveryPrice,
                  value: deliveryPrice! + " - " + MyText.not_pay,
                  mainColor: MyColors.errorRED,
                ),
              )),
          WidgetOrEmpty(
            value: statusId == 0,
            child: Container(
              width: 91.sm,
              height: 40.sm,
              child: AppButton(
                color: MyColors.black,
                textColor: MyColors.white,
                borderRadius: 12,
                textSize: 14.sm,
                text: MyText.pay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
