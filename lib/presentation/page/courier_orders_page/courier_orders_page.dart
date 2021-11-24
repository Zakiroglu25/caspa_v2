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
    return Scaffold(body: SafeArea(
      child: Container(
        color: MyColors.backMainColor,
        child: ListView(
          padding: Paddings.paddingH16,
          children: [

            MySizedBox.h20,
            UnicornOutlineButton(
              strokeWidth: 1.5,
              radius: 16,
              gradient: LinearGradient(colors: [MyColors.gradientBlue,MyColors.gradientCyan,MyColors.gradientRed,MyColors.gradientOrange,]),
              child: Column(
                children: [
                  ProductPropertyV(h: 5,name: "Mağaza dfdfdf fdfds fsdfd dsdffd sdfffd fggdgfdfsdff", value: "Massimo Dutti"),
                  ProductPropertyV(h: 5,name: "Mağaza dfdfdf fdfds fsdfd dsdffd sdfffd fggdgfdfsdff", value: "Massimo Dutti"),
                  ProductPropertyV(h: 5,name: "Mağaza dfdfdf fdfds fsdfd dsdffd sdfffd fggdgfdfsdff", value: "Massimo Dutti"),
                  ProductPropertyV(h: 5,name: "Mağaza dfdfdf fdfds fsdfd dsdffd sdfffd fggdgfdfsdff", value: "Massimo Dutti"),

                ],
              ),
              onPressed: () {},
            ),

          ],
        ),
      ),
    ));
  }
}
