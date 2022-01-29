import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductProperties extends StatelessWidget {
  Package package;

  ProductProperties({required this.package});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Container(
          padding: Paddings.paddingH16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductPropertyV(
                  name: MyText.tracking_id, value: package.tracking),
              ProductPropertyV(
                  name: MyText.from_where, value: package.country!.name),
              ProductPropertyV(name: MyText.shop_name, value: package.store),
              ProductPropertyV(
                  name: MyText.order_date, value: '${package.date} '),
              ProductPropertyV(name: MyText.price, value: "${package.price} "),
              ProductPropertyV(
                  name: MyText.its_weight,
                  value: (((package.weight.toString()) as String) + " kg")),
              ProductPropertyV(
                  name: MyText.shipping_price,
                  value: '${package.cargoPrice} \$'),
              ProductPropertyV(
                  name: MyText.product_kind,
                  value: '${package.category!.name} '),
              ProductPropertyV(
                name: MyText.status,
                value: package.status,
                statusId: 1,
              ),
              // ProductPropertyV(name: MyText.product_count, value: package.),
            ],
          ),
        ),
      ],
    );
  }
}
