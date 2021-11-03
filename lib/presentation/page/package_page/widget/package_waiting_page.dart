import 'package:caspa_v2/presentation/page/package_page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'grid_list_model.dart';

class WaitingPackagePage extends StatelessWidget {
   WaitingPackagePage({Key? key}) : super(key: key);
  List<GridListItems> items = [
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
    GridListItems(
        color: MyColors.grid5,
        shopName: 'Mavi',
        price: "25TL",
        trackingCode: 1234567,
        status: "Xarici anbarda"),
    GridListItems(
        color: MyColors.grid6,
        shopName: 'Trendyol Shop',
        price: "25TL",
        trackingCode: 12345678,
        status: "Yolda"),
    GridListItems(
        color: MyColors.grid1,
        shopName: 'H&M',
        price: "25TL",
        trackingCode: 123456789,
        status: "Xarici anbarda"),
    GridListItems(
        color: MyColors.grid2,
        shopName: 'Massimo Dutti',
        price: "25TL",
        trackingCode: 12345678910,
        status: "Yerli anbarda"),
    GridListItems(
        color: MyColors.grid3,
        shopName: 'Pull and Bear',
        price: "25TL",
        trackingCode: 234,
        status: "Yolda"),
    GridListItems(
        color: MyColors.grid4,
        shopName: 'Zara',
        price: "25TL",
        trackingCode: 23283052058025804,
        status: "Gomrukdedir"),
    GridListItems(
        color: MyColors.grid5,
        shopName: 'Mavi',
        price: "25TL",
        trackingCode: 234,
        status: "Xarici anbarda"),
    GridListItems(
        color: MyColors.grid6,
        shopName: 'Trendyol Shop',
        price: "25TL",
        trackingCode: 234,
        status: "Yolda"),
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation ==
              Orientation.landscape
              ? 3
              : 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (itemHeight / itemHeight),
        ),
        itemBuilder: (
            context,
            index,
            ) {
          return GestureDetector(
            onTap: () {
              NavigateUtils.pushNewRoot(context, PackageDetailsPage());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: items[index].color,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/svg/shop.svg"),
                    Text(items[index].shopName!,style: TextStyle(fontWeight: FontWeight.w600),),
                    Row(
                      children: [
                        const Text(
                          "Qiymət:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: MyColors.textFieldLittleText),
                        ),
                        Text(items[index].price!)
                      ],
                    ),
                    Wrap(
                      children: [
                        const Text("İzləmə kodu:",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: MyColors.textFieldLittleText)),
                        Text("${items[index].trackingCode!}")
                      ],
                    ),
                    Wrap(
                      children: [
                        Text("Status:",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: MyColors.textFieldLittleText)),
                        Text(items[index].status!,maxLines: 3,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
