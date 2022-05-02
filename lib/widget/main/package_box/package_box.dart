import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/main/package_box/widgets/package_box_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

import '../../../infrastructure/models/local/my_user.dart';

class PackageBox extends StatelessWidget {
  Package package;

  double? w;
  int? index;

  PackageBox({required this.package, this.w, this.index});

  CustomPopupMenuController _controller = CustomPopupMenuController();

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
      child: InkWrapper(
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
          padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 0, 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.svgShop),
                  Spacer(),
                  if (package.customStatus == "Təhvil verilib" ||
                      package.customStatus == "Kuryer ilə Təhvil")
                    CustomPopupMenu(
                      arrowSize: 15,
                      position: PreferredPosition.top,
                      arrowColor: MyColors.black,
                      barrierColor: MyColors.transparent,
                      child: SvgPicture.asset(
                        Assets.svgMenuAppbar,
                        color: MyColors.grey153,
                      ),
                      menuBuilder: () => InkWell(
                        onTap: () => context.read<PackageCubit>().delete(
                            context: context, id: package.id, loading: true),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          width: 100,
                          height: 40,
                          child: Center(
                            child: Text(
                              "Baglamani sil",
                              style: AppTextStyles.sanF400.copyWith(
                                  color: MyColors.white, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      pressType: PressType.singleClick,

                      ///mesafe
                      verticalMargin: -5,
                      controller: _controller,
                    ),
                  // myPopMenu(),
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
              PackageBoxDetailText(title: MyText.price, value: package.price),
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
    );
    // );
  }

  Widget myPopMenu() {
    return PopupMenuButton(
      color: MyColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) {
        // Fluttertoast.showToast(
        //     msg: "You have selected " + value.toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      },
      itemBuilder: (context) => [
        PopupMenuItem(
            height: 40,
            value: 1,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Print',
                  style: AppTextStyles.sanF400.copyWith(color: MyColors.white),
                )
              ],
            )),
      ],
    );
  }
}
