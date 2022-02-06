import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttorneyUnicorn extends StatelessWidget {
  final LinkOrder order;

  AttorneyUnicorn({
    required this.order,
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
                ProductPropertyV(
                    h: 8, name: MyText.link_of_order, value: order.link),
                ProductPropertyV(h: 8, name: MyText.amount, value: order.qty),
                ProductPropertyV(h: 8, name: MyText.date, value: order.date),
              ],
            ),
          ),
          onPressed: () => Go.to(context, Pager.orderViaLink(order: order)),
        ),
        MySizedBox.h20,
      ],
    );
  }
}
