import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PackageCard extends StatelessWidget {

  Color? color;
  String? shopName;
  String? status;
  String? price;
  int? trackingCode;


  PackageCard(
      {this.color, this.shopName, this.status, this.price, this.trackingCode});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.sanF400.copyWith(color: MyColors.black),
      overflow: TextOverflow.ellipsis,
      child: InkWrapper(
        highlightColor: MyColors.mainColor.withOpacity(.3),
        radius: 12,
        splashColor: Colors.transparent,
        onTap: () {
          // Navigator.of(context).pushNamed(RouteName.GridViewCustom);
        },
        child: Container(
          width: 284,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(Assets.svgShop),
                Text(shopName!,style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    const Text(
                      "Qiymət:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey153),
                    ),
                    Text('${price}')
                  ],
                ),
                Wrap(
                  children: [
                    const Text("İzləmə kodu:",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey153)),
                    Text("${trackingCode!}")
                  ],
                ),
                Wrap(
                  children: [
                    Text("Status:",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey153)),
                    Text(status!,maxLines: 3,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
