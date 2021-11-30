import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import 'order_select_indicator.dart';

class CourierOrder extends StatelessWidget {
 Function? onTap;
 dynamic order;
 List<dynamic>? selectedOrders;


 CourierOrder({this.onTap, this.order, this.selectedOrders});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onTap!.call(),
      child: FadeInUp(
        delay: Duration(milliseconds: order['id'] * 100),
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 16),
          margin: EdgeInsets.only(bottom: 20),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: selectedOrders!.contains(order['id'])
                ? MyColors.mainOpacity
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: selectedOrders!.contains(order['id'])
                    ? MyColors.mainColor
                    : MyColors.grey153,
                width: selectedOrders!.contains(order['id'])  ? 2 : 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    //ySizedBox.h16,
                    Text(order['name'],
                        style: AppTextStyles.sanF600
                            .copyWith(fontSize: 16)),
                    MySizedBox.h4,

                    Text(order['date'],
                        style: AppTextStyles.sanF400Grey),
                    // MySizedBox.h16,
                  ],
                ),
              ),
              Text("7 264.00 TL",
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 16)),
              MySizedBox.w20,
              OrderSelectIndicator(active: selectedOrders!.contains(order['id']) ,),
            ],
          ),
        ),
      ),
    );
  }
}
