import 'package:caspa_v2/presentation/page/package_page/widget/grid_list_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
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
      child: ListView.builder(
        itemCount: hList.length,
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.of(context).pushNamed(RouteName.GridViewCustom);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 284,
                decoration: BoxDecoration(
                    color: hList[index].color,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/svg/shop.svg"),
                      Text(hList[index].shopName!,style: TextStyle(fontWeight: FontWeight.w600),),
                      Row(
                        children: [
                          const Text(
                            "Qiymət:",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: MyColors.textFieldLittleText),
                          ),
                          Text(hList[index].price!)
                        ],
                      ),
                      Wrap(
                        children: [
                          const Text("İzləmə kodu:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.textFieldLittleText)),
                          Text("${hList[index].trackingCode!}")
                        ],
                      ),
                      Wrap(
                        children: [
                          Text("Status:",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.textFieldLittleText)),
                          Text(hList[index].status!,maxLines: 3,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
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
