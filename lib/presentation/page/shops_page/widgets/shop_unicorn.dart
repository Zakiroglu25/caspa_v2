import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_price_info.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopUnicorn extends StatelessWidget {
  final Shop shop;

  ShopUnicorn({required this.shop});

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      strokeWidth: 1.5,
      radius: 16,
      padding: Paddings.paddingH20 + Paddings.paddingV14,
      gradient: LinearGradient(colors: [
        MyColors.gradientBlue.withOpacity(.5),
        MyColors.gradientCyan.withOpacity(.5),
        MyColors.gradientRed.withOpacity(.5),
        MyColors.gradientOrange.withOpacity(.5),
      ]),
      child: Container(
        width: 161.sp,
        height: 150.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ErrorableImage(
              url: shop.logo!,
              w: 78.sp,
              h: 78.sp,
            ),
            SectionName(title: shop.name)
          ],
        ),
      ),
      onPressed: () {
       if(shop.link!=null){
         launch(shop.link!);
       }
       else{
         Snack.display(context: context,message: MyText.error,positive: false);

       }
      },
    );
  }
}
