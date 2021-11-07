import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

class PackageSliverBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //height: 90,width: 90,
            child: Image.asset(Assets.pngBox)),
        SliverInfo(
            "Hörmətli müştəri, bu bölmədə olan bağlamalar sizə qısa zamanda çatdırılacaq. Əlavə məlumat əldə etmək üçün qaynar xətt:"),
        MySizedBox.h12,
        Container(
            margin: EdgeInsets.only(left: 10),
            height: 40,
            width: 140,
            child: CaspaButton(
              text: "Yeni bağlama sifarişi",
              textSize: 13,
            )),
        MySizedBox.h30,
      ],
    );
  }
}
