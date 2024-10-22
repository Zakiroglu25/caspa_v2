import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import '../../../../widget/custom/order_select_check_indicator.dart';

class SelectablePackage extends StatelessWidget {
  Function? onTap;
  bool selected;
  String price;
  Package package;
  int index;

  SelectablePackage(
      {this.onTap,
      required this.package,
      required this.index,
      required this.price,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    // package.customStatus = MyText.stArrived;
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              OrderSelectCheckIndicator(
                active: selected,
              ),
              MySizedBox.w20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ySizedBox.h16,
                    Text(package.store!,
                        style: AppTextStyles.sanF600.copyWith(fontSize: 16)),
                    MySizedBox.h4,
                    Text(package.date!, style: AppTextStyles.sanF400Grey),
                    // MySizedBox.h16,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
