import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';

import '../promo_code_page.dart';
import 'promo_code_list_element.dart';

class PromoCodesList extends StatelessWidget {
   PromoCodesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           ListView.builder(
      shrinkWrap: true,
      physics: Physics.never,
      itemCount: hList.length*5,
      itemBuilder: (context, index) {
        return PromoCodeListElement(promoCode: hList[0]);
      },
    )
;
  }


  List<CodeModel> hList = [
    CodeModel(code: "COSMOS3", date: "07.10.2021", confrim: "Xeyr"),
    CodeModel(code: "COSMOS3", date: "07.10.2021", confrim: "Xeyr"),
    CodeModel(code: "COSMOS3", date: "07.10.2021 13:50", confrim: "Beli"),
  ];
}
