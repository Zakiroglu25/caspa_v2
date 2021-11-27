import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/custom/buttons/fade_raised_button.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';

import 'widgets/general_order_info.dart';

class CourierOrdersPage extends StatelessWidget {
  const CourierOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CaspaAppbar(
          title: MyText.confirm,
          user: false,
        ),
        body: SafeArea(
          child: Container(
            //color: MyColors.backMainColor,
            padding: Paddings.paddingH16,
            child: Stack(
              children: [
                ListView(
                  //padding: Paddings.paddingH16,
                  children: [
                    MySizedBox.h20,
                    OrderUnicorn(
                      title: 'Baglama 1',
                      sellerName: "Trendyol",
                      trackingCode: '545678',
                      statusId: 1,
                      deliveryPrice: '45.89 AZN',
                      price: '87.0 AZN',
                    ),
                    OrderUnicorn(
                      title: 'Baglama 2',
                      sellerName: "Trendyol",
                      trackingCode: '545678',
                      statusId: 2,
                      deliveryPrice: '45.89 AZN',
                      price: '87.0 AZN',
                    ),
                    SectionName(title: MyText.general_info),
                    GeneralOrderInfo(),
                    MySizedBox.h40,
                    CaspaButton(text: MyText.confirming,onTap: ()=>Go.to(context, Pager.order_success),),
                    MySizedBox.h10,
                  ],
                ),

                // Positioned(
                //     bottom: 0,
                //     left: 0,
                //     right: 0,
                //     child: FadeRaisedButton(
                //       title: MyText.confirming,
                //     ))
              ],
            ),
          ),
        ));
  }
}
