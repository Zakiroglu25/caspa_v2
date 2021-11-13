import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TariffCard extends StatelessWidget {
  String? tarifName;
  String? price;


  TariffCard({this.tarifName, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.mainGrey),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tarifName!,
              style: TextStyle(fontSize: 16.sm, fontWeight: FontWeight.w600),
            ),
            MySizedBox.h5,
            Text(price.toString() + "USD",
                style: AppTextStyles.sanF600.copyWith(
                  color: MyColors.green,
                  fontSize: 16.sm
                ))
          ],
        ),
      ),
    );
  }
}
