import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeclarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.textBlack),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Bəyan et",
          style: AppTextStyles.sanF600
              .copyWith(color: MyColors.textBlack, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120.sp,
                height: 120.sp,
                child: Image.asset(Assets.otherBox),
              ),
              SectionName(title: "Məhsulları əlavə edin"),
              MySizedBox.h12,
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  MyText.declareText,
                  style:
                      AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
                ),
              ),
              MySizedBox.h48,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionName(title: "Məhsul 1"),
                  InkWell(
                      onTap: () {}, child: SvgPicture.asset(Assets.svgTrash))
                ],
              ),
              MySizedBox.h24,
              CaspaField(
                title: "Satıcı",
                hint: "Satıcının adını daxil edin",
              ),

              ///dropdownolacaq
              ///dropdownolacaq
              CaspaField(
                title: "Məhsulun sayı",
                hint: "Sayı daxil edin",
              ),
              CaspaField(
                title: "İzləmə kodu",
                hint: "Kodu daxil edin",
              ),
              CaspaField(
                title: "Qeyd",
                hint: "Qeydlərinizi buraya daxil edin",
              ),
              SectionName(title: "Faktura"),
              MySizedBox.h16,
              Container(
                width: 120.sp,
                height: 120.sp,
                decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(Icons.camera),
                ),
              ),
              MySizedBox.h12,
              Text(
                MyText.factura,
                style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
              ),
              MySizedBox.h12,
              CaspaButton(
                text: "Fayl əlavə et",
                w: 110.sp,
                h: 44.sp,
                textSize: 14.sp,
              ),
              MySizedBox.h24,
              CaspaButton(text: "Davam et"),
              MySizedBox.h40,
            ],
          ),
        ),
      ),
    );
  }
}
