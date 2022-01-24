import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'sebet_image.dart';

class PageViewTwo extends StatelessWidget {
  const PageViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingA16,
      child: Column(
        children: [
          SebetImage(),
          Spacer(),
          Center(
            child: Text(
              "Siz alın, gətirməyi isə bizə həvalə edin!",
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
            MyText.pageViewTwo,
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
