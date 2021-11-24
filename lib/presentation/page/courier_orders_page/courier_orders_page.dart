import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';

class CourierOrdersPage extends StatelessWidget {
  const CourierOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: MyColors.backMainColor,
        child: ListView(
          padding: Paddings.paddingH16,
          children: [
            MySizedBox.h20,
            OrderUnicorn(
              sellerName: "Trendyol",
              trackingCode: '545678',
              statusId: 1,
              deliveryPrice: '45.89 AZN',
              price: '87.0 AZN',
            ),
          ],
        ),
      ),
    ));
  }
}
