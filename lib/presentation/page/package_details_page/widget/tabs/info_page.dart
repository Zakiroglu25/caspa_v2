import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import '../info_header.dart';

class InfoTab extends StatelessWidget {
  Package package;

  InfoTab({required this.package});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          //SectionName(title: MyText.general_info,hP: 16,),
          ProductProperties(
            package: package,
          ),
          MySizedBox.h16,
          //SectionName(title: MyText.products,hP: 16,),
          //MySizedBox.h16,
          // StaggeredGridView.countBuilder(
          //   primary: false,
          //   padding:  Paddings.paddingH16,
          //   crossAxisCount: 4,
          //   shrinkWrap: true,
          //   itemCount: listProduct.length,
          //   mainAxisSpacing: 10,
          //   crossAxisSpacing: 10,
          //   itemBuilder: (context, index) => ProductBox(
          //     listProduct[index]
          //   ),
          //   staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
          // ),
        ],
      ),
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
