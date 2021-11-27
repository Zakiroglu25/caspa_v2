import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewOrderPaymentPage extends StatelessWidget {
  const NewOrderPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Yeni sifariş",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Addım 2/2",
                style: UITextStyle.tW400BigBlack,
              ),
              MySizedBox.h26,
              //error verdi deye Asset. elemedim
              Container(
                  width: ScreenUtil().setWidth(120),
                  height: ScreenUtil().setWidth(120),
                  child: Image.asset("assets/png/payment.png")),
              MySizedBox.h12,
              SectionName(title: "Məhsulları əlavə edin"),
              MySizedBox.h12,
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  MyText.paymentLinkTxt,
                  style:
                      AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
                ),
              ),
              MySizedBox.h40,
              SectionName(title: "Sürətli ödəniş"),
              MySizedBox.h16,
              UnicornOutlineButton(
                strokeWidth: 1.5,
                radius: 16,
                padding: Paddings.paddingH20 + Paddings.paddingV20,
                gradient: const LinearGradient(colors: [
                  MyColors.gradientBlue,
                  MyColors.gradientCyan,
                  MyColors.gradientRed,
                  MyColors.gradientOrange,
                ]),
                onPressed: () {},
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SectionName(title: "Balansımnan"),

                          ///radiobutton yeri
                        ],
                      ),
                      MySizedBox.h16,
                      CaspaField(
                        title: "Məbləğ",
                      ),
                      CaspaField(
                        title: "Promokod",
                      )
                    ],
                  ),
                ),
              ),
              MySizedBox.h16,

              UnicornOutlineButton(
                strokeWidth: 1.5,
                radius: 16,
                padding: Paddings.paddingH20 + Paddings.paddingV20,
                gradient: const LinearGradient(colors: [
                  MyColors.gradientBlue,
                  MyColors.gradientCyan,
                  MyColors.gradientRed,
                  MyColors.gradientOrange,
                ]),
                onPressed: () {},
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SectionName(title: "Balansımnan"),

                          ///radiobutton yeri
                        ],
                      ),
                      Image.asset("assets/png/caspacard.png")
                    ],
                  ),
                ),
              ),
              MySizedBox.h80,
              CaspaButton(
                text: "Davam et " + "545" + "TRY",
              ),
              MySizedBox.h32,
            ],
          ),
        ),
      ),
    );
  }
}
