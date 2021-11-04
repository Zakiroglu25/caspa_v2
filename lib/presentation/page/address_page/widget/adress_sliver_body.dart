import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class AdressSliverAppbarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.pngGlobus),
        Container(
          // color: Colors.orange,
          margin: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width - 40,
          child: RichText(
            text: TextSpan(
              text:
              "Hörmətli müştəri, əlavə məlumat əldə etmək üçün qaynar xətt:",
              children: [
                TextSpan(
                    text: ' *1453',
                    style: AppTextStyles.coHead400
                        .copyWith(
                        color:
                        MyColors.mainColor))
              ],
              style: AppTextStyles.coHead400.copyWith(
                  fontSize: 16,
                  color: MyColors.grey165),
            ),
          ),
        )
      ],
    );
  }
}
