import 'package:caspa_v2/presentation/page/promo_code_page/promo_code_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodeListElement extends StatelessWidget {

  final CodeModel promoCode;


  PromoCodeListElement({required this.promoCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          Text(
            promoCode.code,
            style: AppTextStyles.sanF400.copyWith(
                fontSize: 16.sp, color: MyColors.grey153),
          ),
          MySizedBox.w45,
          Text(
            promoCode.date.toString(),
            style: AppTextStyles.sanF400.copyWith(
                fontSize: 16.sp, color: MyColors.grey153),
          ),
          Spacer(),
          Text(
            promoCode.confrim.toString(),
            style: AppTextStyles.sanF400.copyWith(
                fontSize: 16.sp, color: MyColors.grey153),
          ),
        ],
      ),
    );
  }
}
