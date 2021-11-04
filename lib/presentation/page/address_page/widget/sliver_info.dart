import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class SliverInfo extends StatelessWidget {
  String? info;


  SliverInfo(this.info);

  @override
  Widget build(BuildContext context) {
    return             Container(
      width: MediaQuery.of(context).size.width-40,
      margin: EdgeInsets.only(left: 10),
      child: RichText(
        text: TextSpan(
          text:
          info!,
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
    );
  }
}
