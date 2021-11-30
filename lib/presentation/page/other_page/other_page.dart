import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Digər",
                style: UITextStyle.tW400BigBlack,
              ),
            ),
            MySizedBox.h26,
            Container(
              width: 120,
              height: 120,
              child: Image.asset(Assets.otherBox),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Text(
                MyText.otherPage,
                style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
              ),
            ),
            MySizedBox.h30,
            Container(
              width: ScreenUtil().setWidth(343),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(251, 228, 228, 1)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mağazalar "),
                        Text(
                          MyText.otherShop,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Image.asset(Assets.shopMobile),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
