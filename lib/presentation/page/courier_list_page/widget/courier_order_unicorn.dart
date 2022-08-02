import 'package:flutter/material.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/constants/app_text_styles.dart';
import 'courier_pay_button.dart';

class CourierOrderUnicorn extends StatelessWidget {
  const CourierOrderUnicorn({Key? key, required this.courier})
      : super(key: key);
  final CourierOrder courier;

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      strokeWidth: 1.5,
      radius: 16,
      padding: Paddings.paddingH20 + Paddings.paddingV16,
      gradient: LinearGradient(colors: [
        MyColors.gradientBlue.withOpacity(.5),
        MyColors.gradientCyan.withOpacity(.5),
        MyColors.gradientRed.withOpacity(.5),
        MyColors.gradientOrange.withOpacity(.5),
      ]),
      onPressed: () {},
      child: DefaultTextStyle(
        style: AppTextStyles.sanF400
            .copyWith(color: MyColors.grey153, fontSize: 14.sm),
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "${courier.products!.map((e) => e.cargoTracking).toList().join(', ')}",
                  style: AppTextStyles.sanF600
                      .copyWith(color: MyColors.black, fontSize: 16.sm)),
              MySizedBox.h8,
              Text(
                "${courier.region!.name}",
              ),
              MySizedBox.h8,
              Text(
                "${courier.address}",
              ),
              MySizedBox.h8,
              Text(
                "${courier.updateDate}",
              ),
              MySizedBox.h8,
              if (courier.payment == 0)
                Text(MyText.youMustPaid,
                    style:
                        AppTextStyles.sanF400.copyWith(color: MyColors.orange)),
              if (courier.payment == 1)
                Text(MyText.paid,
                    style:
                        AppTextStyles.sanF400.copyWith(color: MyColors.green)),
              if (courier.payment == 2)
                Text(MyText.pickedup,
                    style: AppTextStyles.sanF400
                        .copyWith(color: MyColors.mainBlue)),
            ],
          ),
        ),
      ),
    );
  }
}
