import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/delegate/navigate_utils.dart';
import 'invoice_image_details.dart';
import 'product_invoice.dart';

class ProductProperties extends StatelessWidget {
  Package package;

  ProductProperties({required this.package});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Paddings.paddingH16,
      physics: Physics.never,
      shrinkWrap: true,
      children: [
        ProductPropertyV(
          name: MyText.view,
          h: 0,
        ),
        MySizedBox.h2,
        ProductInvoice(
          store: package.store!,
          url: package.invoice,
        ),
        MySizedBox.h16,
        ProductPropertyV(
            name: MyText.tracking_id,
            value: package.cargoTracking ?? MyText.didntDetermine),
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
            value: "${package.price ?? MyText.didntDetermine}"),
        ProductPropertyV(
            name: MyText.width_under,
            value: "${package.width ?? MyText.didntDetermine}"),
        ProductPropertyV(
            name: MyText.height_under,
            value: "${package.height ?? MyText.didntDetermine}"),
        ProductPropertyV(
            name: MyText.lenght_under,
            value: "${package.length ?? MyText.didntDetermine}"),
        ProductPropertyV(
            name: MyText.its_weight,
            value: ((((package.weight ?? 0.0).toString()) as String) + " kg")),
        ProductPropertyV(
            name: MyText.shipping_price, value: '${package.cargoPrice} \$'),

        ProductPropertyV(
            name: MyText.product_kind, value: '${package.category!.name} '),
        ProductPropertyV(
            name: MyText.product_kind, value: '${package.} '),
        ProductPropertyV(
          name: MyText.status,
          value: package.status,
          statusId: (package.status == MyText.deliveredWithCourier ||
                  package.status == MyText.pickedup)
              ? 1
              : 0,
        ),
        // ProductPropertyV(name: MyText.product_count, value: package.),
      ],
    );
  }
}
