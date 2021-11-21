import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LinkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: Paddings.paddingH16 +
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          children: [
            MySizedBox.h24,
            SectionName(
              title: "İnformasiya",
            ),
            MySizedBox.h16,
            CaspaField(
              title: "Məhsulun linki",
            ),
            CaspaField(
              title: "Məhsulun sayı",
              suffixText: "ədəd",
            ),
           // GenderFieldRegister(),
            //GenderFieldRegister(),
            Wrap(
              children: [
                CaspaField(title: "Qiymət",),
              ],
            ),

            //burda mehsul novu olacaq
            //burda ,ehsulun alt novu
          ],
        ),
      ],
    );
  }
}
