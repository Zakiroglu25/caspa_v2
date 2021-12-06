import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/material.dart';

class PromoCodePage extends StatelessWidget {
  const PromoCodePage({Key? key}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
