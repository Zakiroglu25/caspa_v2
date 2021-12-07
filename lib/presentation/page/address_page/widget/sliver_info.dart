import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverInfo extends StatelessWidget {
  String? info;
  TextAlign? align;

  SliverInfo(this.info,{this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: EdgeInsets.only(left: 10),
      child: RichText(
        textAlign: align??TextAlign.start,
        text: TextSpan(
          text: info!,
          children: [
            TextSpan(
                text: ' *1453',
                style:
                    AppTextStyles.sanF400.copyWith(color: MyColors.mainColor))
          ],
          style: AppTextStyles.sanF400
              .copyWith(fontSize: 14.sm, color: MyColors.grey165),
        ),
      ),
    );
  }
}
