import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/gradients.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:caspa_v2/widget/main/product_box/widgets/product_property_v.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../infrastructure/cubits/order_via_url_list/order_via_url_list_cubit.dart';
import 'order_via_link_select_checkbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderUnicorn extends StatelessWidget {
  final LinkOrder order;
  const OrderUnicorn({
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySizedBox.h16,
            UnicornOutlineButton(
                strokeWidth: 1.5,
                radius: 16,
                padding: Paddings.paddingH20 + Paddings.paddingV14,
                gradient: Gradients.unicorn,
                child: Container(
                  //width: 200,
                  child: Column(
                    children: [
                      AbsorbPointer(
                        child: ProductPropertyV(
                            onTap: () => launchUrlString(order.link!),
                            h: 8,
                            name: MyText.link_of_order,
                            value: order.link),
                      ),
                      ProductPropertyV(
                          h: 8, name: MyText.amount, value: order.qty),
                      ProductPropertyV(
                          h: 8, name: MyText.date, value: order.date),
                      ProductPropertyV(
                          h: 8,
                          name: MyText.status,
                          mainColor: order.payment == 0
                              ? MyColors.errorRED211
                              : MyColors.green,
                          value: order.payment == 0
                              ? MyText.waitinPaymentForConfirm
                              : MyText.paid),
                    ],
                  ),
                ),
                onPressed: () =>
                    context.read<OrderViaUrlListCubit>().addOrder(order)),
            MySizedBox.h20,
          ],
        ),
        if(order.payment == 0)
        OrderViaLinkSelectCheckbox(
          order: order,
        )
      ],
    );
  }
}
