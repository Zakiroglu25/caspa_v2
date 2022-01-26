import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductProperties extends StatelessWidget {
  Package package;

  ProductProperties({required this.package});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      padding: Paddings.paddingH16,
      physics: Physics.never,
      shrinkWrap: true,
      children: [
        Container(
            height: 60,
            // color: MyColors.black,
            child: ProductPropertyV(
                name: MyText.tracking_id,
                value: package.tracking ?? MyText.didntDetermine)),
        ProductPropertyV(
            name: MyText.from_where,
            value: package.country!.name ?? MyText.didntDetermine),
        ProductPropertyV(
            name: MyText.shop_name,
            value: package.store ?? MyText.didntDetermine),
        ProductPropertyV(
            name: MyText.order_date,
            value: '${package.date ?? MyText.didntDetermine} '),
        ProductPropertyV(
            name: MyText.price,
            value: "${package.price ?? MyText.didntDetermine} "),
        ProductPropertyV(
            name: MyText.its_weight,
            value: ((((package.weight ?? 0.0).toString()) as String) + " kg")),
        ProductPropertyV(
            name: MyText.shipping_price, value: '${package.cargoPrice} \$'),
        ProductPropertyV(
            name: MyText.product_kind, value: '${package.category!.name} '),
        ProductPropertyV(
          name: MyText.status,
          value: package.status,
          statusId: package.status == "Təhvil verildi" ? 1 : 0,
        ),
        // ProductPropertyV(name: MyText.product_count, value: package.),
      ],
    );
  }
}
