import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

import 'fields/height_field.dart';
import 'fields/lenght_field.dart';
import 'fields/width_field.dart';
import 'news_calculate.dart';
import 'result_calculate.dart';

class CapacityPage extends StatelessWidget {
  const CapacityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // KgField(),
          WidthField(),
          LenghtField(),
          HeightField(),
          SectionName(title: "Hesablamanın nəticəsi:",),
          MySizedBox.h16,
          ResultCalculate(result: 12.4,),
          MySizedBox.h32,
          SectionName(title: "Xəbəriniz olsun  ‍✈️️",),
          MySizedBox.h12,
          DescriptionTextWidget(text: MyText.info,),
          MySizedBox.h40,
          CaspaButton(text: "Hesabla",),
          MySizedBox.h30,
        ],
      ),
    );
  }
}
