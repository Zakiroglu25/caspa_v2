import 'package:caspa_v2/presentation/page/package_page/widget/grid_list_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/elements/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:caspa_v2/util/constants/assets.dart';

class HomaPackageList extends StatelessWidget {
  const HomaPackageList({
    Key? key,
    required this.hList,
  }) : super(key: key);

  final List<GridListItems> hList;

  @override
  Widget build(BuildContext context) {
    List<GridListItems> hList = [
      GridListItems(
          color: MyColors.grid1,
          shopName: 'H&M',
          price: "25TL",
          trackingCode: 12,
          status: "Xarici anbarda"),
      GridListItems(
          color: MyColors.grid2,
          shopName: 'Massimo Dutti',
          price: "25TL",
          trackingCode: 1234,
          status: "Yerli anbarda"),
      GridListItems(
          color: MyColors.grid3,
          shopName: 'Pull and Bear',
          price: "25TL",
          trackingCode: 12345,
          status: "Yolda"),
      GridListItems(
          color: MyColors.grid4,
          shopName: 'Zara',
          price: "25TL",
          trackingCode: 123456,
          status: "Gomrukdedir"),
    ];
    return Container(
      height: 170,
      width: 284,
      child: ListView.separated(
        padding: Paddings.paddingH20,
        separatorBuilder: (context, index) {
          return MySizedBox.w12;
        },
        itemCount: hList.length,
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PackageCard(
            color: hList[index].color,
            shopName: hList[index].shopName,
            price: hList[index].price,
            trackingCode: hList[index].trackingCode,
            status: hList[index].status,
          );
        },
      ),
    );
  }
}

class TarifModel {
  String? tarifName;
  double? price;

  TarifModel(
    this.tarifName,
    this.price,
  );
}
