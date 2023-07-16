import 'package:caspa_v2/infrastructure/cubits/courier/courier_list_cubit/courier_list_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/delete_button.dart';
import 'package:caspa_v2/widget/general/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/models/remote/response/packages_data.dart';
import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/delegate/pager.dart';
import '../../../../util/screen/alert.dart';

class CourierEditAndDelete extends StatelessWidget {
  const CourierEditAndDelete(
      {Key? key, required this.courier, required this.packages})
      : super(key: key);
  final CourierOrder courier;
  final List<Package> packages;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: courier.payment == 0,
      child: Positioned(
        right: 16,
        top: 8,
        child: Row(
          children: [
            EditButton(
              // onTap: () => context
              //     .read<CourierListCubit>()
              //     .edit(context, courierOrder: courier, packages: packages)
              onTap: () => Go.to(context, Pager.courier(courierOrder: courier)),
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
                    .read<CourierListCubit>().
                    delete(context, courier.id, loading: true),
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
