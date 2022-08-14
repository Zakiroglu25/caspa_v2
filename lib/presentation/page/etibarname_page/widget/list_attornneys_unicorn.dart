import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';

class AttorneyUnicorn extends StatelessWidget {
  final Attorney attorney;

  AttorneyUnicorn({
    required this.attorney,
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
                ProductPropertyV(h: 8, name: "Ad", value: attorney.fullName),
                ProductPropertyV(
                    h: 8, name: "Ş/V-nin nömrəsi", value: attorney.idNumber),
                ProductPropertyV(h: 8, name: "Fin", value: attorney.fin),
              ],
            ),
          ),
          onPressed: () =>
              Go.to(context, Pager.addOrEditAttorney(attorney: attorney)),
        ),
        MySizedBox.h20,
      ],
    );
  }
}
