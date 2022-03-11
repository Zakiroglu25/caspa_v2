import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsCard extends StatelessWidget {
  String? desc;
  String? url;
  double? w;
  bool? isVertical;

  AdsCard({this.desc, this.w, this.isVertical, this.url});

  @override
  Widget build(BuildContext context) {
    isVertical ??= false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200.sp,
          height: 100.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyColors.mainGrey),
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ErrorableImage(
                url: url!,
                fit: BoxFit.fill,
              ),
            ),
          ), // Text(
        ),
        Text(
          desc!,
          style: TextStyle(fontSize: 16.sm, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
