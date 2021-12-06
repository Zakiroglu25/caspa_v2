import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

class PackageSliverBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 110, width: 110, child: Image.asset(Assets.pngBox)),
        SliverInfo(MyText.packagesWillDeliverToYou),
        MySizedBox.h12,
        Container(
            margin: EdgeInsets.only(left: 10),
            height: 40,
            width: 140,
            child: CaspaButton(
              text: MyText.orderNewPackages,
              textSize: 13,
            )),
        MySizedBox.h30,
      ],
    );
  }
}
