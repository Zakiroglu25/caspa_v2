import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/util/constants/alerts.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../util/screen/alert.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';
import '../../../../widget/custom/caspa_payment_radio.dart';
import '../../../../util/constants/colors.dart';

class CourierPayButton extends StatelessWidget {
  const CourierPayButton({Key? key, required this.courier}) : super(key: key);
  final CourierOrder courier;

  static HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: WidgetOrEmpty(
        value: courier.payment == 0,
        child: CaspaButton(
          h: 44.sp,
          w: 135.sp,
          onTap: () => Alerts.courierPaymentAlert(
              context: context, courierId: courier.id),
          color: MyColors.black,
          textColor: MyColors.white,
          borderRadius: 12,
          textSize: 14.sm,
          text: MyText.pay + " " + "${courier.price} AZN",
        ),
      ),
    );
  }
}
