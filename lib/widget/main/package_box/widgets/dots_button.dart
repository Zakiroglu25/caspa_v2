import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../infrastructure/cubits/packages/packages_cubit.dart';
import '../../../../infrastructure/models/remote/response/packages_data.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';

class DotsButton extends StatelessWidget {
  const DotsButton({Key? key, required this.package, required this.controller})
      : super(key: key);
  final Package package;
  final CustomPopupMenuController controller;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 21.sp,
      right: 0.sp,
      child: WidgetOrEmpty(
        value: package.customStatus == "Təhvil verilib" ||
            package.customStatus == "Kuryer ilə Təhvil",
        elseChild: Container(),
        child: CustomPopupMenu(
          arrowSize: 15,
          position: PreferredPosition.top,
          arrowColor: MyColors.black,
          barrierColor: MyColors.transparent,
          child: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.only(right: 17.sp),
            color: MyColors.transparent,
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                Assets.svgDots,
                color: MyColors.grey153,
              ),
            ),
          ),

          menuBuilder: () => InkWell(
            onTap: () => context
                .read<PackageCubit>()
                .delete(context: context, id: package.id, loading: true),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              padding: Paddings.paddingH4,
              width: 110,
              height: 40,
              child: Center(
                child: Text(
                  " Baglamani sil ",
                  style: AppTextStyles.sanF400
                      .copyWith(color: MyColors.white, fontSize: 14.sp),
                ),
              ),
            ),
          ),
          pressType: PressType.singleClick,

          ///mesafe
          verticalMargin: -5,
          controller: controller,
        ),
      ),
    );
  }
}
