import 'package:caspa_v2/infrastructure/cubits/get_attorneys/attorney_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/general/delete_button.dart';
import 'package:caspa_v2/widget/general/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';
import 'list_orders_unicorn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBox extends StatelessWidget {
  LinkOrder order;

  OrderBox(this.order);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${MyText.order}: ${order.id}",
              style: UITextStyle.tW600Black.copyWith(fontSize: 16.sp),
            ),
            Spacer(),
            EditButton(
              onTap: () => Go.to(context, Pager.orderViaLink(order: order)),
            ),
            MySizedBox.w10,
            DeleteButton(
                onTap: () => Alert.show(context,
                    title: MyText.are_u_sure_delete,
                    //s  content: MyText.you_can_not_recovery_it_again,
                    buttonText: MyText.yes,
                    cancelButton: true,
                    onTap: () => context
                        .read<OrderViaUrlListCubit>()
                        .delete(order.id, loading: false),
                    image: SizedBox(
                        width: 120.sm,
                        height: 120.sm,
                        child: Image.asset(Assets.pngSad))))
          ],
        ),
        OrderUnicorn(
          order: order,
        ),
      ],
    );
  }
}
