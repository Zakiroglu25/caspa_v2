import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/section_name_and_definition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/fields/category_field.dart';
import 'widgets/fields/count_field.dart';
import 'widgets/fields/note_field.dart';
import 'widgets/fields/seller_field.dart';
import 'widgets/fields/tracking_id_field.dart';
import 'widgets/photo_pickment.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(title: MyText.report, user: false, contextA: context),
      body: SafeArea(
        child: ListView(
          padding: Paddings.paddingH16,
          children: [
            SectionNameAndDefinition(
              imagePath: Assets.otherBox,
              name: MyText.addProduct,
              definition: MyText.declareText,
            ),
            MySizedBox.h24,
            SellerFieldReport(),
            CategoryFields(),
            CountFieldReport(),
            TrackingIdFieldReport(),
            NoteFieldReport(),
            SectionName(title: "Faktura"),
            MySizedBox.h16,
            PhotoPickment(),
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
    );
  }
}
