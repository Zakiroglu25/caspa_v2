import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

import 'fields/amount_field.dart';

class AddBalancePage extends StatelessWidget {
  late TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        user: false,
        notification: false,
      ),
      body: Padding(
        padding: Paddings.paddingA16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Balans artımı",
              style: UITextStyle.tW400BigBlack,
            ),
            MySizedBox.h32,
            AmountField(
                // controller: controller,
                ),
            Spacer(),
            CaspaButton(
              text: "Balansı artır",
            ),
            MySizedBox.h32,
          ],
        ),
      ),
    );
  }
}
