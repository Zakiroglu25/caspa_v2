import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/material.dart';

import 'add_etibarname_page.dart';

class EtibarnamePage extends StatelessWidget {
  const EtibarnamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: "Etibarnamələr 📑",
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            ColorfullBackImage(
              path: Assets.etibarname,
              infoTitle: MyText.littleEtibar,
              infoContent: MyText.paymentLinkTxt,
            ),
            MySizedBox.h16,
            CaspaButton(text: "Yeni etibarnamə",onTap: (){
              Go.to(context, AddEtibarname());
            },),
            MySizedBox.h32,
            SectionName(title: "Etibarnamə"),
            OrderUnicorn(

            )
          ],
        ),
      ),
    );
  }
}
