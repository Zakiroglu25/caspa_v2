import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';

class GeneralOrderInfo extends StatelessWidget {
  const GeneralOrderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                 Container(
      child: Column(
        children: [
          ProductPropertyV(
            name: MyText.phone_number,
            value: "+994 50 805 05 20",
            h: 10,
          ),
          ProductPropertyV(
            name: MyText.delivery_adress,
            value: "Ruzigar Qasımov 50",
            h: 10,
          ),
          ProductPropertyV(
            name: MyText.note,
            value:
            "FLOOR 16, 44, JAFAR JABBARLY STR, P.O. Box: AZ1065",
            h: 10,
          ), ProductPropertyV(
            name: MyText.total_price,
            value:
            "2 434.00 AZN",
            h: 10,
          ),
        ],
      ),
    )
;
  }
}
