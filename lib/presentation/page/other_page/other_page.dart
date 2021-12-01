import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
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
        padding: const EdgeInsets.only(left: 0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Digər",
                  style: UITextStyle.tW400BigBlack,
                ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 19, bottom: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mağazalar ",
                          style: AppTextStyles.sanF600.copyWith(fontSize: 16),
                        ),
                        MySizedBox.h6,
                        Container(
                          width: 165,
                          height: 72,
                          child: Text(
                            MyText.otherShop,
                            textAlign: TextAlign.start,
                            style: AppTextStyles.sanF400Grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Image.asset(Assets.shopMobile),
                  MySizedBox.w16
                ],
              ),
            ),
            MySizedBox.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    // Go.to(context, LinkPage());
                  },
                  child: Container(
                    width: 167,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 251, 221, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Etibarnamə 📑️",
                              style: AppTextStyles.coHead600
                                  .copyWith(fontSize: 16)),
                          MySizedBox.h6,
                          Text(
                            "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                            style: AppTextStyles.sanF400.copyWith(
                                fontSize: 12, color: MyColors.grey153),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 167,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 241, 249, 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ayarlar ⚙️",
                            style:
                                AppTextStyles.coHead600.copyWith(fontSize: 16)),
                        MySizedBox.h6,
                        Text(
                          "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                          style: AppTextStyles.sanF400
                              .copyWith(fontSize: 12, color: MyColors.grey153),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
