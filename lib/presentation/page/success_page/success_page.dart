import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/material.dart';
import 'widgets/congrats_text.dart';
import 'widgets/go_home_button.dart';
import 'widgets/order_on_the_way_text.dart';
import 'widgets/success_again_button.dart';

class SuccessPage extends StatelessWidget {
  final String? infoContent;
  final String? infoTitle;
  final Widget? againPage;

  SuccessPage({this.infoContent, this.infoTitle, this.againPage});

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
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColorfullBackImage(
                    path: Assets.pngFlyingGirl,
                    title: MyText.congrats,
                    infoContent: infoContent ?? MyText.orderOnTheWayInfo,
                    infoTitle: infoTitle ?? MyText.orderOnTheWay,
                  ),
                  MySizedBox.h8,
                  SuccessAgainButton(
                    againPage: againPage,
                  ),
                ],
              ),
              GoHomeButton()
            ],
          ),
        ));
  }
}
