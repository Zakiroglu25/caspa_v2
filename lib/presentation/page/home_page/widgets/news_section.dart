import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsCard extends StatelessWidget {
  String? desc;
  double? w;
  bool? isVertical;
  AdsCard({this.desc,this.w,this.isVertical});

  @override
  Widget build(BuildContext context) {
    isVertical ??= false;




    return Container(
      width: (isVertical!) ? null :284.sp,
      padding: isVertical! ? Paddings.paddingA20 :const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.mainGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            desc!,
            style: TextStyle(fontSize: 16.sm, fontWeight: FontWeight.w600),
          ),
          MySizedBox.h5,
        ],
      ),
    );
  }
}
