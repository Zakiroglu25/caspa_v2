import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'widgets/congrats_text.dart';
import 'widgets/go_home_button.dart';
import 'widgets/order_on_the_way_text.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.white,
          elevation: 0,
        ),
        body: Container(
          padding: Paddings.paddingH16,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CongratsText(),
                  Image.asset(Assets.pngFlyingGirl),
                  MySizedBox.h16,
                  OrderOnTheWayText(),
                ],
              ),
              GoHomeButton()            ],
          ),
        ));
  }
}