import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import 'page_top_small_image.dart';

class SectionNameAndDefinition extends StatelessWidget {
final String? name;
final String? definition;
final String? imagePath;


SectionNameAndDefinition({required this.name,required this.definition,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTopSmallImage(path: imagePath!),
        MySizedBox.h12,
        SectionName(title: name),
        MySizedBox.h12,
        Text(
         definition!,
          style:
          AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
        ),
      ],
    );
  }
}
