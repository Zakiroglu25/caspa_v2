import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

class InProductInfoWidget extends StatelessWidget {
  const InProductInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
    );
  }
}
