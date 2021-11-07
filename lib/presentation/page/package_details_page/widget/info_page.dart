import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/main/product_box/product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'info_header.dart';



class InfoTab extends StatelessWidget {
  InfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Container(
     // color: MyColors.white ,
      //padding: Paddings.paddingH16,
      child: ListView(
        shrinkWrap: true,
        children: [
          SectionName(title: 'Ümumi məlumat',hP: 16,),
          ProductProperties(),
          MySizedBox.h16,
          SectionName(title: 'Məhsullar',hP: 16,),
          MySizedBox.h16,
          StaggeredGridView.countBuilder(
            primary: false,
            padding:  Paddings.paddingH16,
            crossAxisCount: 4,
            shrinkWrap: true,
            itemCount: listProduct.length,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (context, index) => ProductBox(
              listProduct[index]
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
          ),
        ],
      ),
    );
  }
}


List<StaggeredModel> listProduct = [
  StaggeredModel(
      name: "Chelsea Bot  Chelsea BotChelsea BotChelsea BotChelsea Bot",
      price: 345,
      body: 41,
      color: "Black",
      productNum: 09090910,
      count: 1,
      allPrice: 350.00),
  StaggeredModel(
      name: "Chelsea Bot  Chelsea  Chelsea Chelsea Chelsea ChelseaBotChelsea BotChelsea BotChelsea Bot",
      price: 345,
      body: 41,
      color: "Black",
      productNum: 09090910,
      count: 1,
      allPrice: 350.00),
  StaggeredModel(
      name: "Chelsea Bot  Chelsea BotChelsea BotChelsea BotChelsea Bot",
      price: 345,
      body: 41,
      color: "Black",
      productNum: 09090910,
      count: 1,
      allPrice: 350.00),
  StaggeredModel(
      name: "Chelsea Bot   BotChelsea BotChelsea BotChelsea Bot",
      price: 345,
      body: 41,
      color: "Black",
      productNum: 0978785435589090910,
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