import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'sebet_image.dart';

class PageViewTwo extends StatelessWidget {
  const PageViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SebetImage(),
        Spacer(),
        const Center(
          child: Text(
            "Siz alın, gətirməyi isə bizə həvalə edin",
            style: TextStyle(
              fontFamily: "CoHeadline",
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: MyColors.mainBlue2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            MyText.pageViewTwo,
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
