import 'package:caspa_v2/presentation/page/package_page/widget/package_waiting_page.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/elements/package_box.dart';
import 'package:caspa_v2/widget/elements/package_box_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomaPackageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 116.sm,
     // width: 284,
      child: ListView.separated(
        padding: Paddings.paddingH20,
        separatorBuilder: (context, index) {
          return MySizedBox.w12;
        },
        shrinkWrap: true,
        itemCount: packageBoxes.length,
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PackageBoxHome(
              packageBoxes[index],w: 284.sp,
          );
        },
      ),
    );
  }
}

