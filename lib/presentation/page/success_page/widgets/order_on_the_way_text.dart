import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

class ColorfullyBackImageInfo extends StatelessWidget {

  String ? infoTitle;
  String ? infoContent;


  ColorfullyBackImageInfo({required this.infoTitle,required this.infoContent});

  @override
  Widget build(BuildContext context) {
    return                   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionName(title: infoTitle,vP: 0,),
        MySizedBox.h12,
        Text(
          infoContent??'',
          style: AppTextStyles.sanF400Grey,
        )
      ],
    );
  }
}