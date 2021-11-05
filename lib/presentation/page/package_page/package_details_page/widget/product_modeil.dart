import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  String? productName;


  Product(this.productName);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height/2,
      width: size.width/2,
      decoration: BoxDecoration(
        color: MyColors.mainGrey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(productName!),
        ],
      ),
    );
  }
}
