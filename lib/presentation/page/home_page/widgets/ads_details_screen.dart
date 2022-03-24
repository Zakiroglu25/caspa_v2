import 'package:caspa_v2/util/screen/errorable_image.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false ,
          backgroundColor: MyColors.white,
          elevation: 0,
          title: Text("Xəbərlər",
              style: UITextStyle.tW600Black.copyWith(fontSize: 16)),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: MyColors.black,
                  )),
            ),
          ],
        ),
        body: ListView(
          children: [
            MySizedBox.h16,
            ErrorableImage(
              url: hList.image.toString(),

            ),
            MySizedBox.h16,
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Text("${hList.title}",
                  style: UITextStyle.tW600Black.copyWith(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text("${hList.description}",
                  style:
                      AppTextStyles.sanF400.copyWith(color: MyColors.grey153)),
            ),
            MySizedBox.h14,
          ],
        ),
      ),
    );
  }
}
