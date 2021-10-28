import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'rocket_image.dart';

class PageViewOne extends StatelessWidget {
  const PageViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.safeBlockHorizontal! * 200,
          height: SizeConfig.safeBlockVertical! * 50,
          child: RocketImage(),
        ),
        Spacer(),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              "Sürətli çatdırılma sözdə deyil, əməldədir!",
              style: AppTextStyles.coHead400.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: MyColors.mainBlue2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            MyText.pageViewOne,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyColors.splashLittleText,
                fontSize: 14,
                fontFamily: "San Francisco"),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
