import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/grid_list_model.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageBox extends StatelessWidget {
  GridListItems item;
  double sW;

  PackageBox(this.item, this.sW);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go.to(context, PackageDetailsPage());
      },
      child: DefaultTextStyle(
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.sanF400
            .copyWith(fontSize: 14.sp, color: MyColors.black),
        child: BounceInUp(
          child: Container(
            decoration: BoxDecoration(
                color: item.color, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(Assets.svgShop),
                  Text(
                    item.shopName!,
                    style: AppTextStyles.sanF500,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Qiymət: ",
                        style: TextStyle(color: MyColors.textFieldLittleText),
                      ),
                      Text(item.price!)
                    ],
                  ),
                  Wrap(
                    children: [
                      const Text("İzləmə kodu: ",

                          style: TextStyle(color: MyColors.textFieldLittleText)),
                      Text("${item.trackingCode!}")
                    ],
                  ),
                  Wrap(
                    children: [
                      const Text("Status: ",
                          style:  TextStyle(
                              color:  MyColors.textFieldLittleText)),
                      Text(
                        item.status!,
                        maxLines: 3,
                      ),
                    ],
                  )
                ],
              ),
            ),
            //width: 80,
          ),
        ),
      ),
    );
  }
}
