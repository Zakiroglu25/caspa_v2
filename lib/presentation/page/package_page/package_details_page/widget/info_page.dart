import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'info_header.dart';

List<StaggeredModel> listProduct = [
  StaggeredModel(
      name: "Chelsea Bot",
      price: 345,
      body: 41,
      color: "Black",
      productNum: 09090910,
      count: 1,
      allPrice: 350.00),
  StaggeredModel(
      name: "Chelsea Bot",
      price: 345,
      body: 41,
      color: "Black",
      productNum: 09090910,
      count: 1,
      allPrice: 350.00)
];

class Info extends StatelessWidget {
  Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            child: InfoHeader(),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              // Map<String, String> product =
              // products![index].cast<String, String>();
              return Card(
                child: Container(
                  color: Colors.grey[400],
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Center(
                        child: Text("s")),
                  ),
                ),
              );
            },
            childCount: listProduct.length,
          ),
        ),
    ],
    );
  }
}

class StaggeredModel {
  String? name;
  int? price;
  int? body;
  String? color;
  int? productNum;
  int? count;
  double? allPrice;

  StaggeredModel(
      {this.name,
      this.price,
      this.body,
      this.color,
      this.productNum,
      this.count,
      this.allPrice});
}

Widget listi() {
  return Expanded(
    child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: listProduct.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MySizedBox.h16,
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(child: SvgPicture.asset(Assets.svgShop)),
                    ),
                    Row(
                      children: [
                        Text("Name"),
                        Text(listProduct[index].name.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Qiymət:"),
                        Text(listProduct[index].price.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Beden:"),
                        Text(listProduct[index].body.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Renk:"),
                        Text(listProduct[index].color.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Urun no:"),
                        Text(listProduct[index].productNum.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Say:"),
                        Text(listProduct[index].count.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Toplam:"),
                        Text(listProduct[index].allPrice.toString())
                      ],
                    ),
                  ],
                ),
              ));
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 1.6 : 1.8);
        }),
  );
}
