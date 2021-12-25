import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AttorneyUnicorn extends StatelessWidget {
  final String? fullname;
  final String? passport;
  final String? fin;
  AttorneyUnicorn(
      {this.fullname,
        this.passport,
        this.fin,
        });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //SectionName(title:title??""),
        MySizedBox.h16,
        UnicornOutlineButton(
          strokeWidth: 1.5,
          radius: 16,
          padding: Paddings.paddingH20 + Paddings.paddingV14,
          gradient: LinearGradient(colors: [
            MyColors.gradientBlue,
            MyColors.gradientCyan,
            MyColors.gradientRed,
            MyColors.gradientOrange,
          ]),
          child: Container(
            //width: 200,
            child: Column(
              children: [
                ProductPropertyV(h: 8, name: "Ad", value: fullname),
                ProductPropertyV(h: 8, name: "Ş/V-nin nömrəsi", value: passport),
                ProductPropertyV(h: 8, name: "Fin", value: fin),

              ],
            ),
          ),
          onPressed: () {},
        ),
        MySizedBox.h20,
      ],
    );
  }
}
