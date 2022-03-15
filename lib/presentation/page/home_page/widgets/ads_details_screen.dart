import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/models/remote/response/ads_model.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/constants/text_styles.dart';
import '../../../../util/delegate/navigate_utils.dart';

class AdsDetailsPage extends StatelessWidget {
  const AdsDetailsPage({Key? key, required this.hList}) : super(key: key);

  final Data hList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            MySizedBox.h16,
            Stack(
              children: [
                Center(
                  child: Text("Xəbərlər",
                      style: UITextStyle.tW600Black.copyWith(fontSize: 16)),
                ),
                Positioned(
                  right: 16,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear)),
                ),
              ],
            ),
            MySizedBox.h16,
            Image.network(
              hList.image.toString(),
            ),
            MySizedBox.h16,
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,16,12),
              child: Text("${hList.title}",
                  style: UITextStyle.tW600Black.copyWith(fontSize: 16)),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(16,16,16,0),
              child: Text("${hList.description}",
                  style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153)),
            ),
            MySizedBox.h14,
          ],
        ),
      ),
    );
  }
}
