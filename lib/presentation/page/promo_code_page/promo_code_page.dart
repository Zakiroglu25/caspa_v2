import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodePage extends StatelessWidget {
  PromoCodePage({Key? key}) : super(key: key);

  List<CodeModel> hList = [
    CodeModel(code: "COSMOS3", date: "07.10.2021 13:50", confrim: "Xeyr"),
    CodeModel(code: "COSMOS3", date: "07.10.2021 13:50", confrim: "Xeyr"),
    CodeModel(code: "COSMOS3", date: "07.10.2021 13:50", confrim: "Beli"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: "Promokod 🎉",
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            ColorfullBackImage(
              path: Assets.pngRocket,
              infoTitle: MyText.littlePromo,
              infoContent: MyText.infoPromo,
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
                Spacer(),
                Text(
                  "Tarix",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                Spacer(),
                Text(
                  "İstifadə edilib",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
            MySizedBox.h40,
            Container(
              width: 300,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: hList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        hList[index].code!.toString(),
                        style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                      ),
                      Spacer(),
                      Text(
                        hList[index].date!.toString(),
                        style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                      ),
                      Spacer(),
                      Text(
                        hList[index].confrim!.toString(),
                        style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                      ),
                    ],
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

  CodeModel({this.code, this.date, this.confrim});
}
