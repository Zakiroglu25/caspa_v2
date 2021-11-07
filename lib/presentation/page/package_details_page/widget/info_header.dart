import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductProperties extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Rndm.color,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          ...boxes,
          Container(
            padding: Paddings.paddingH16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductPropertyV(name: "Mağazanın adı", value: "Massimo dutti"),
                ProductPropertyV(name: "Qiymət", value: "764 TL"),
                ProductPropertyV(name: "İzləmə kodu", value: "252442"),
                ProductPropertyV(
                  name: "Status",
                  value: "Yoldadır",
                  statusId: 1,
                ),
                ProductPropertyV(name: "Məhsulun sayı", value: "4"),
              ],
            ),
          ),
        ],
      ),
    );
  }


  List boxes = [ Positioned(
      right: (-80),
      child: Container(
        width: 150,
        height: 150,
        child: Opacity(opacity: .3,
          child: Image.asset(
            Assets.pngBox,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
      )),
    Positioned(
        left: (-80),
        child: Container(
          width: 150,
          height: 150,
          child: Opacity(
            opacity: .3,
            child: Image.asset(
              Assets.pngBox,
              fit: BoxFit.cover,
              width: 150,
              height: 150
            ),
          ),
        )),
  ];
}
