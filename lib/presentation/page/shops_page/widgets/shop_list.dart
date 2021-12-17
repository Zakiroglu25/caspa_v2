import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/presentation/page/shops_page/widgets/shop_unicorn.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopListView extends StatelessWidget {
  final List<Shop> shopList;

  ShopListView(this.shopList);

  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
        list: shopList,
        child: GridView.builder(
          itemCount: shopList.length,
          padding: Paddings.paddingA16,
          physics: BouncingScrollPhysics(),
          // if you want IOS bouncing effect, otherwise remove this line
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 164.sp,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp),
          //change the number as you want
          itemBuilder: (context, index) {
            return FadeInUp(
              duration: Duration(milliseconds: (index*100)<2000?index*100 : 400),
              child: ShopUnicorn(
                shop: shopList[index],
              ),
            );
          },
        ));
  }
}
