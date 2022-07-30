import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsCard extends StatelessWidget {
  final String? desc;
  final String? url;
  final String? title;
  final double? w;
  final bool? isVertical;

  const AdsCard(
      {this.title, this.desc, this.w, this.isVertical = false, this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94.sp,
      child: Stack(
        //mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 94.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.mainGrey),
            child: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ErrorableImage(
                  url: url!,
                  fit: BoxFit.fill,
                  w: 150.sp,
                ),
              ),
            ), // Text(
          ),
          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: MyColors.black.withOpacity(.3),
          //         borderRadius:
          //             BorderRadius.vertical(bottom: Radius.circular(12))),
          //     child: ScrollingText(
          //       desc!,
          //       w: 94.sp,
          //       //  overflow: TextOverflow.ellipsis,
          //       style: TextStyle(
          //           fontSize: 12.sm,
          //           fontWeight: FontWeight.w600,
          //           color: MyColors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
