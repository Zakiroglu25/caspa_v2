import 'package:caspa_v2/presentation/page/package_details_page/in_product_page.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/tabs/info_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_h.dart';
import 'package:flutter/material.dart';
import 'widgets/product_photo.dart';

class ProductBox extends StatelessWidget {
  final StaggeredModel listProduct;
  const ProductBox(this.listProduct, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.coHead400.copyWith(color: MyColors.grey165),
      child: GestureDetector(
        onTap: () {
          Go.to(context, InProductPage());
        },
        child: Container(
            decoration: const BoxDecoration(
                color: MyColors.mainGrey,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: Paddings.paddingA16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizedBox.h16,
                  ProductPhoto(),
                  MySizedBox.h12,
                  ProductPropertyH(name: 'Name', value: listProduct.name),
                  ProductPropertyH(name: 'Qiymət', value: listProduct.price),
                  ProductPropertyH(name: 'Beden', value: listProduct.body),
                  ProductPropertyH(
                      name: 'Urun no', value: listProduct.productNum),
                  ProductPropertyH(name: 'Say', value: listProduct.count),
                  ProductPropertyH(name: 'Toplam', value: listProduct.allPrice),
                ],
              ),
            )),
      ),
    );
  }
}
