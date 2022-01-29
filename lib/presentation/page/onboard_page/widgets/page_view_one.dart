import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'rocket_image.dart';

class PageViewOne extends StatelessWidget {
  const PageViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingA16,
      child: Column(
        children: [
          RocketImage(),
          Spacer(),
          Center(
            child: Text(
              "Sürətli çatdırılma sözdə deyil, əməldədir!",
              style: AppTextStyles.coHead400.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                height: 1.1,
                color: MyColors.black34,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          MySizedBox.h16,
          Text(
            MyText.pageViewOne,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400,
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
