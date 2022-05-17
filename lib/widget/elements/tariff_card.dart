import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TariffCard extends StatelessWidget {
  String? tarifName;
  String? price;
  double? w;
  bool? isVertical;

  TariffCard({Key? key, this.tarifName, this.price, this.w, this.isVertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    isVertical ??= false;
    return Container(
      width: (isVertical!) ? null : 284.sp,
      padding:
          isVertical! ? Paddings.paddingA20 : const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: MyColors.mainGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tarifName!,
            style: TextStyle(fontSize: 16.sm, fontWeight: FontWeight.w600),
          ),
          MySizedBox.h5,
          if (tarifName!.length > 20)
            Text(price.toString() + "USD",
              style: AppTextStyles.sanF600
                  .copyWith(color: MyColors.green, fontSize: 16.sm)),
          if (tarifName!.length < 19)
            Text(price.toString() + "AZN",
                style: AppTextStyles.sanF600
                    .copyWith(color: MyColors.green, fontSize: 16.sm)),
        ],
      ),
    );
  }
}
