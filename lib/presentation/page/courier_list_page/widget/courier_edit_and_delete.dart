import 'package:caspa_v2/infrastructure/cubits/courier/courier_list_cubit/courier_list_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/delete_button.dart';
import 'package:caspa_v2/widget/general/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../util/screen/alert.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';
import '../../../../widget/custom/caspa_payment_radio.dart';
import '../../../../util/constants/colors.dart';

class CourierEditAndDelete extends StatelessWidget {
  const CourierEditAndDelete({Key? key, required this.courier})
      : super(key: key);
  final CourierOrder courier;

  static HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: courier.payment == 0,
      child: Positioned(
        right: 16,
        top: 16,
        child: Row(
          children: [
            EditButton(
              onTap: () {},
            ),
            MySizedBox.w5,
            DeleteButton(
              onTap: () => Alert.show(
                context,
                title: MyText.are_u_sure_delete,
                //s  content: MyText.you_can_not_recovery_it_again,
                buttonText: MyText.yes,
                cancelButton: true,
                onTap: () => context
                    .read<CourierListCubit>()
                    .delete(courier.id, loading: false),
                image: SizedBox(
                  width: 120.sm,
                  height: 120.sm,
                  child: Image.asset(Assets.pngSad),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}