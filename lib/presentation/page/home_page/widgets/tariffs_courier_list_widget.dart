import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/elements/tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/delegate/pager.dart';

class CourierTarifListWidget extends StatelessWidget {
  final List<Region> hList;
  bool? isVertical;

  CourierTarifListWidget({
    Key? key,
    required this.hList,
    this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    isVertical ??= false;
    return FadeIn(
      child: SizedBox(
        height: isVertical! ? null : 92.sp,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return isVertical! ? MySizedBox.h16 : MySizedBox.w10;
          },
          shrinkWrap: true,
          primary: false,
          itemCount: hList.length,
          scrollDirection: isVertical! ? Axis.vertical : Axis.horizontal,
          itemBuilder: (context, index) {
            Region tariff = hList[index];
            return FadeInUp(
              duration: Duration(
                  milliseconds: isVertical! ? AppOperations.getTime(index) : 0),
              child: TariffCard(
                showUSD: false,
                w: 120,
                tarifName: tariff.name,
                price: tariff.price,
                isVertical: isVertical,
                //w: (isVertical ?? false) ? null : 284.sp,
              ),
            );
          },
        ),
      ),
    );
  }
}
