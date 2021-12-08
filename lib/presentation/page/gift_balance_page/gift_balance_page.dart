import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftBalance extends StatelessWidget {
   GiftBalance({Key? key}) : super(key: key);


  List<CodeModel> hList = [
    CodeModel(code: "caspa azerbaycan214987563", date: "07.10.2021 13:50", confrim: "Xeyr",balance: "4.00"),
    CodeModel(code: "caspa azerbaycan214987563", date: "07.10.2021", confrim: "Xeyr",balance: "4.00"),
    CodeModel(code: "COSMOS3", date: "07.10.2021 13:50", confrim: "Beli",balance: "4.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: "Hədiyyə balansı 💸",
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            ColorfullBackImage(
              path: Assets.posTerminal,
              infoTitle: MyText.littleGift,
              infoContent: MyText.InfoGift,
            ),
            MySizedBox.h16,
            CaspaField(
              title: "Promokod",
              hint: "Promokod",
            ),
            MySizedBox.h16,
            CaspaButton(text: "Tətbiq et"),
            MySizedBox.h32,
            Row(
              children: [
                Text(
                  "Kod",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                MySizedBox.w90,
                Text(
                  "Tarix",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                MySizedBox.w70,

                Text(
                  "Edilib",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                Spacer(),
                Text(
                  "Balans",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
            Container(
              width: 300,
              height: MediaQuery.of(context).size.height/2,
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: hList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      children: [
                        Container(
                          width:110.sp,
                          height: 72.sp,
                          child: Text(
                            hList[index].code!.toString(),
                            style: AppTextStyles.sanF400.copyWith(
                                fontSize: 16.sp, color: MyColors.grey153),
                          ),
                        ),
                        Container(
                          width:75.sp,
                          height: 48.sp,
                          child: Text(
                            hList[index].date!.toString(),
                            style: AppTextStyles.sanF400.copyWith(
                                fontSize: 16.sp, color: MyColors.grey153),
                          ),
                        ),
                        Spacer(),

                        Text(
                          hList[index].confrim!.toString(),
                          style: AppTextStyles.sanF400.copyWith(
                              fontSize: 16.sp, color: MyColors.grey153),
                        ),
                        Spacer(),
                        Text(
                          hList[index].balance!.toString(),
                          style: AppTextStyles.sanF400.copyWith(
                              fontSize: 16.sp, color: MyColors.grey153),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CodeModel {
  String? code;
  String? date;
  String? confrim;
  String? balance;

  CodeModel({this.code, this.date, this.confrim,this.balance});
}

