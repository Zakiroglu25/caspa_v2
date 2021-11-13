import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KuryerPage extends StatelessWidget {
  const KuryerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: 'Kuryer sifarişi',
        user: false,
        notification: false,
        centerTitle: true,
        contextA: context,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/png/bck.png"),
                  ),
                ),
              ),
              Positioned(
                top: 65,
                left: 65,
                right: 65,
                child: SizedBox(
                  child: Image.asset(
                    'assets/png/moto.png',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionName(title: "Sizin məlumatlarınız bizdə var 😊"),
                MySizedBox.h12,
                Text(
                  MyText.kuryerTxt,
                  style: UITextStyle.tW400Grey,
                ),
                MySizedBox.h24,
                SectionName(title: "Çatdırılma məlumatları"),
                MySizedBox.h16,
                CaspaTextFieldUnder("Rayon"),
                CaspaField(
                  hint: 'Rayonu daxil edin',
                ),
                CaspaTextFieldUnder("Ünvan"),
                CaspaField(
                  hint: 'Rayonu daxil edin',
                ),
                SectionName(title: "Bağlamanı seçin"),

              ],
            ),
          )
        ],
      ),
    );
  }
}
