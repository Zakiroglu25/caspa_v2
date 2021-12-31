import 'package:caspa_v2/presentation/page/new_order_payment_page/widgets/payment_unicorn.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/presentation/page/new_order_payment_page/widgets/payment_unicorn.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ByCardChoice extends StatelessWidget {
  const ByCardChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          MyText.total_price,
          style: AppTextStyles.sanF400
              .copyWith(color: MyColors.grey153),
        ),
        Text(
          "382,00 AZN",
          style: AppTextStyles.sanF400
              .copyWith(color: MyColors.textRED, fontSize: 16.sp),
        ),
        Image.asset("assets/png/caspacard.png"),
        CaspaField(
          title: "Bonuslar",
        ),
        CaspaField(
          title: "Promokod",
          hint: "Kodu daxil edin",
        )
      ],
    );
  }
}
