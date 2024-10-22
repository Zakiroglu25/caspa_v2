import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/main/package_box/widgets/dots_button.dart';
import 'package:caspa_v2/widget/main/package_box/widgets/package_box_detail_text.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PackageBox extends StatelessWidget {
  Package package;
  double? w;
  int? index;

  PackageBox({required this.package, this.w, this.index});

  final CustomPopupMenuController _controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    // return InkWrapper(
    //   highlightColor: MyColors.white.withOpacity(.4),
    //   radius: 12,
    //   splashColor: Colors.transparent,
    //   onTap: () => Go.to(
    //       context,
    //       Pager.packageDetails(
    //         package: package,
    //       )),
    //   child:
    return DefaultTextStyle(
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.sanF400
          .copyWith(fontSize: 14.sp, color: MyColors.black),
      child: Stack(
        children: [
          InkWrapper(
            onTap: () => Go.to(
                context,
                Pager.packageDetails(
                  package: package,
                )),
            child: Container(
              width: w,
              decoration: BoxDecoration(
                  color: AppOperations.colorWithId(package.id!),
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.svgShop),
                      MySizedBox.w8,
                      if (package.payment == 1)
                        Container(
                          width: 64.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyColors.black34),
                          child: Center(
                            child: Text(
                              "Ödənilib",
                              style: AppTextStyles.sanF400.copyWith(
                                  color: MyColors.white, fontSize: 12.sp),
                            ),
                          ),
                        ),
                    ],
                  ),
                  MySizedBox.h10,
                  Text(
                    package.store!,
                    style: AppTextStyles.sanF600.copyWith(fontSize: 16.sm),
                  ),
                  MySizedBox.h10,
                  PackageBoxDetailText(
                      title: MyText.trackingCode, value: package.cargoTracking),
                  MySizedBox.h4,
                  PackageBoxDetailText(
                      title: MyText.price,
                      value: package.price != null
                          ? "${package.price} ${MyText.tryy}"
                          : '-'),
                  MySizedBox.h4,
                  PackageBoxDetailText(
                      title: MyText.tracking_id, value: package.tracking),
                  MySizedBox.h4,
                  PackageBoxDetailText(
                      title: MyText.status, value: package.status!),
                ],
              ),
              //width: 80,
            ),
          ),
          DotsButton(
            key: Key("${package.id}"),
            package: package,
            controller: _controller,
          )
        ],
      ),
    );
    // );
  }
}
