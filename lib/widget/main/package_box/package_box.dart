import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/main/package_box/widgets/package_box_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageBox extends StatelessWidget {
  Package package;
  double? w;
  int? index;

  PackageBox({required this.package, this.w, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      highlightColor: MyColors.white.withOpacity(.4),
      radius: 12,
      splashColor: Colors.transparent,
      onTap: () => Go.to(
          context,
          Pager.packageDetails(
            package: package,
          )),
      child: DefaultTextStyle(
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.sanF400
            .copyWith(fontSize: 14.sp, color: MyColors.black),
        child: Container(
          width: w,

          decoration: BoxDecoration(
              color: AppOperations.colorWithId(package.id!),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(Assets.svgShop),
                Text(
                  package.store!,
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sm),
                ),
                PackageBoxDetailText(title: MyText.price, value: package.price),
                PackageBoxDetailText(
                    title: MyText.tracking_id, value: package.tracking),
                PackageBoxDetailText(
                    title: MyText.status, value: package.status!),
              ],
            ),
          ),
          //width: 80,
        ),
      ),
    );
  }
}