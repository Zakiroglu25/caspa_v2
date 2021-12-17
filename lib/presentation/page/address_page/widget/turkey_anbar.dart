import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';

import 'copiable_field.dart';

class TurkeyAnbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: ListView(
        physics: Physics.never,
        padding: Paddings.paddingH20,
        shrinkWrap: true,
        children: [
          CopiableField(
            title: "İsim",
            data: "Bahtiyar",
          ),
          CopiableField(
            title: "Soy isim",
            data: "Bahtiyarli",
          ),
          CopiableField(
            title: "İlçe",
            data: "Ataşehir",
          ),
          CopiableField(
            title: "Adres satır 1",
            data: "İnönü Cad.no:9/3, Yeni Sahra BN:f7fe27 34746  C111141",
          ),
          CopiableField(
            title: "İl:",
            data: "İstanbul ",
          ),
          CopiableField(
            title: "Mahalle",
            data: "Yenisahra",
          ),
          CopiableField(
            title: "Telefon:",
            data: "05437750818",
          ),
          CopiableField(
            title: "Tc kimlik:",
            data: "31583104656",
          ),
          CopiableField(
            title: "Posta Kodu:",
            data: "34746",
          ),
          CopiableField(
            //  maxLines: 1,
            title: "Adres Başlığı:",
            data:
            "CASPA bhjb dfjsnjkdgnjkdfg jfskjdgfhjkdgf skjfshjkgdfhjfbkjfskjdgfhjkdgfjfskjdgfhjkdgfjfskjdgfhjkdgf jfskjdgfhjkdgf",
          ),
          MySizedBox.h100
        ],
      ),
    );
  }
}
