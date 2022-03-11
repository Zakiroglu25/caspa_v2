import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/errorable_image.dart';
import 'package:caspa_v2/widget/general/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsCard extends StatelessWidget {
  final String? desc;
  final String? url;
  final double? w;
  final bool? isVertical;

  const AdsCard({this.desc, this.w, this.isVertical = false, this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.sp,
      child: Stack(
        //mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                  w: 200.sp,
                ),
              ),
            ), // Text(
          ),
          Positioned(
            bottom: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.black.withOpacity(.3),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12))),
              child: ScrollingText(
                desc!,
                w: 200.sp,
                //  overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12.sm,
                    fontWeight: FontWeight.w600,
                    color: MyColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
