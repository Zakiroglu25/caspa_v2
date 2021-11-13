import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:caspa_v2/widget/elements/package_box.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';

import 'grid_list_model.dart';

List<GridListItems> packageBoxes = [
  GridListItems(
      color: Rndm.color,
      shopName: 'H&M',
      price: "25TL",
      trackingCode: 12,
      status: "Xarici anbarda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Massimo Dutti',
      price: "25TL",
      trackingCode: 1234,
      status: "Yerli anbarda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Pull and Bear',
      price: "25TL",
      trackingCode: 12345,
      status: "Yolda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Zara',
      price: "25TL",
      trackingCode: 123456,
      status: "Gomrukdedir"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Mavi',
      price: "25TL",
      trackingCode: 1234567,
      status: "Xarici anbarda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Trendyol Shop',
      price: "25TL",
      trackingCode: 12345678,
      status: "Yolda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'H&M',
      price: "25TL",
      trackingCode: 1234567,
      status: "Xarici anbarda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Massimo Dutti',
      price: "25TL",
      trackingCode: 1234567,
      status: "Yerli anbarda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Pull and Bear',
      price: "25TL",
      trackingCode: 234,
      status: "Yolda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Zara',
      price: "25TL",
      trackingCode: 232830,
      status: "Gomrukdedir"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Mavi',
      price: "25TL",
      trackingCode: 234,
      status: "Xarici anbarda"),
  GridListItems(
      color: Rndm.color,
      shopName: 'Trendyol Shop',
      price: "25TL",
      trackingCode: 234,
      status: "Yolda"),
];

class WaitingPackagePage extends StatelessWidget {
  WaitingPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final sW = size.width;

    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: GridView.builder(
        padding: Paddings.paddingA20,
        physics: Physics.never,
        itemCount: packageBoxes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 3
                  : 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (1 / 1),
        ),
        itemBuilder: (
          context,
          index,
        ) {
          return PackageBox(
            packageBoxes[index],
            w: sW,
          );
        },
      ),
    );
  }
}
