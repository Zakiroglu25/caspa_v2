import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TariffCard extends StatelessWidget {
  final String? tarifName;
  final String? price;
  final String? type;
  final double? w;
  bool? isVertical;

  TariffCard({Key? key, this.tarifName, this.price, this.w, this.isVertical, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isVertical = isVertical ?? false;

    double priceInUsd = double.tryParse(price ?? "0") ?? 0;
    double priceInAzn = priceInUsd * 1.7;
    String formattedUsdPrice = "${priceInUsd.toStringAsFixed(2)} USD";
    String formattedAznPrice = "${priceInAzn.toStringAsFixed(2)} AZN";

    return Container(
      width: (isVertical!) ? null : 280.sp,
      padding: isVertical! ? Paddings.paddingA20 : const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: MyColors.mainGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tarifName ?? "",
            style: TextStyle(fontSize: 16.sm, fontWeight: FontWeight.w600),
          ),
          MySizedBox.h5,
          Text(
            "$formattedUsdPrice | $formattedAznPrice",
            style: AppTextStyles.sanF600.copyWith(color: MyColors.green, fontSize: 16.sm),
          ),
        ],
      ),
    );
  }
}


