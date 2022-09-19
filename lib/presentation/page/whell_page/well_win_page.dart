import 'package:flutter/material.dart';

import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/assets.dart';
import '../../../util/constants/colors.dart';
import '../../../util/constants/sized_box.dart';
import '../../../util/delegate/navigate_utils.dart';

class WellWinPage extends StatelessWidget {
  const WellWinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 54,
            right: 16,
            child: InkWell(
              onTap: () => Go.pop(context),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColors.black),
                  width: 24,
                  height: 24,
                  child: Center(
                      child: Icon(
                    Icons.clear_outlined,
                    color: MyColors.white,
                  ))),
            ),
          ),
          Positioned(
            top: 98,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Təbrik edirik!",
                  style: AppTextStyles.coHead400.copyWith(fontSize: 25),
                ),
                SizedBox(
                    width: 24, height: 24, child: Image.asset(Assets.pngGift)),
                MySizedBox.h8,
                SizedBox(
                  width: 295,
                  child: Text(
                      "Siz Caspa-dan 8.00 ₼ məbləğində hədiyyə çatdırılma balansə qazandınız!",
                      style: AppTextStyles.coHead400.copyWith(fontSize: 16)),
                ),
                MySizedBox.h16,
                Image.asset(Assets.pngColorfulBack)
              ],
            ),
          ),
          Positioned(bottom: 0, child: Image.asset(Assets.winWin))
        ],
      ),
    );
  }
}
