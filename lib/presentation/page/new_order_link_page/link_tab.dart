import 'package:caspa_v2/app.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/caspa_drop_down.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/new_order_payment_page/new_order_payment_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.newOrder,
        user: false,contextA: context,

      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 20, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyText.step+" 1/2",
                style: UITextStyle.tW400BigBlack,
              ),
              MySizedBox.h26,
              SizedBox(
                  width: 120.sp,
                  height: 120.sp,
                  child: Image.asset(Assets.linkGirl)),
              MySizedBox.h12,
              SectionName(title: MyText.addProduct),
              MySizedBox.h12,
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  MyText.linkTxt,
                  style:
                      AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
                ),
              ),
              MySizedBox.h40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionName(title: "Məhsul 1"),
                  InkWell(onTap: () {}, child: SvgPicture.asset(Assets.svgTrash))
                ],
              ),
              MySizedBox.h16,
              CaspaField(
                title: "Məhsulun linki",
                hint: "Məhsulun linkini daxil edin",
              ),
              CaspaField(
                textInputType: TextInputType.text,
                title: MyText.productNumber,
                hint: MyText.productNumber,
                suffixText: "Ədəd   ",
              ),
              Row(
                children: [
                  Expanded(
                    child: CaspaField(
                      textInputType: TextInputType.text,
                      title: MyText.price,
                      hint: MyText.price,
                    ),
                  ),
                  MySizedBox.w10,
                  Container(
                    width: 96,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyColors.mainGrey),
                    // child: DropdownButton(
                    //   items: [], onChanged: (Object? value) {  },
                    // ),
                  ),
                ],
              ),
              Text(
                MyText.comission,
                style: AppTextStyles.sanF400Grey,
              ),
              MySizedBox.h4,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    color: Color.fromRGBO(211, 41, 45, 0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "0%",
                        style: AppTextStyles.sanF400.copyWith(fontSize: 15),
                      )),
                ),
              ),
              MySizedBox.h16,
              CaspaField(
                title: MyText.total_price,
                hint: MyText.total_price,
                suffixText: "TRY  ",
              ),
              //davametin yaninda toplam qiymet olacaq
              CaspaButton(
                onTap: (){
                  Go.to(context, NewOrderPaymentPage());
                },
                text: MyText.goOn,
              ),
              MySizedBox.h32,
            ],
          ),
        ),
      ),
    );
  }
}
