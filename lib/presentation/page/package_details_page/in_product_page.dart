import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adı",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "Relaxed Fit Fitilli Kadife Gömlek Ceket",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
                Text(
                  "Qiymət",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "349,00 TL",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
                Text(
                  "Beden",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "41",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
                Text(
                  "Renk",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "Açık kahve",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
                Text(
                  "Urun no",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "09001234504",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
                Text(
                  "Məlumat",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "Bu urun 41 bedene uygundur",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
                Text(
                  "Say",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textFieldLittleText,
                      fontFamily: "San Francisco"),
                ),
                Text(
                  "1",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textBlack,
                      fontFamily: "San Francisco"),
                ),
                MySizedBox.h20,
              ],
            )
          ],
        ),
      ),
    );
  }
}
