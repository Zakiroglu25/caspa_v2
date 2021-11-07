import 'package:caspa_v2/presentation/page/package_page/widget/grid_list_model.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/package_waiting_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/elements/package_box.dart';
import 'package:caspa_v2/widget/elements/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:caspa_v2/util/constants/assets.dart';

class HomaPackageList extends StatelessWidget {
  const HomaPackageList({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Container(
    height: 180.sm,
     // width: 284,
      child: ListView.separated(
        padding: Paddings.paddingH20,
        separatorBuilder: (context, index) {
          return MySizedBox.w12;
        },
        shrinkWrap: true,
        itemCount: packaeBoxes.length,
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PackageBox(
              packaeBoxes[index],w: 284.sp,
          );
        },
      ),
    );
  }
}

class TarifModel {
  String? tarifName;
  double? price;

  TarifModel(
    this.tarifName,
    this.price,
  );
}
