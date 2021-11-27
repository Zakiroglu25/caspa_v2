import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

class OrderOnTheWayText extends StatelessWidget {
  const OrderOnTheWayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionName(title: MyText.orderOnTheWay),
        MySizedBox.h12,
        Text(
          MyText.orderOnTheWayInfo,
          style: AppTextStyles.sanF400Grey,
        )
      ],
    );
  }
}
