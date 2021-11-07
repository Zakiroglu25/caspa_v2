import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/in_product_info_widget.dart';

class InProductPage extends StatelessWidget {
  InProductPage({Key? key}) : super(key: key);

  List<dynamic> assets = [
    Assets.svgBottomBox,
    Assets.svgShop,
    Assets.svgUser,
    Assets.svgBottomBox,
    Assets.svgBottomBox,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "product Name",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
        child: ListView(
          children: [
            SectionName(title: "Foto"),
            MySizedBox.h16,
            Wrap(
              spacing: 8,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.mainGrey,
                    ),
                    child: Center(child: SvgPicture.asset(Assets.svgShop)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.mainGrey,
                    ),
                    child: Center(child: SvgPicture.asset(Assets.svgShop)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.mainGrey,
                    ),
                    child: Center(child: SvgPicture.asset(Assets.svgShop)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.mainGrey,
                    ),
                    child: Center(child: SvgPicture.asset(Assets.svgShop)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.mainGrey,
                    ),
                    child: Center(child: SvgPicture.asset(Assets.svgShop)),
                  ),
                ),
              ],
            ),
            MySizedBox.h48,
            SectionName(title: "Məlumat"),
            MySizedBox.h20,
            InProductInfoWidget(),
          ],
        ),
      ),
    );
  }
}
