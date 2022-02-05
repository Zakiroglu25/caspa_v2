import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:flutter/material.dart';

import 'order_select_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierOrder extends StatefulWidget {
  Function? onTap;
  Package package;
  //List<dynamic>? selectedOrders;
  int index;

  CourierOrder(
      {this.onTap,
      required this.package,
      //    this.selectedOrders,
      required this.index});

  @override
  State<CourierOrder> createState() => _CourierOrderState();
}

class _CourierOrderState extends State<CourierOrder> {
  @override
  Widget build(BuildContext context) {
    final selectedOrders = context.watch<CourierCubit>().selectedOrders.value;
    widget.package.customStatus = MyText.stArrived;
    return Stack(
      fit: StackFit.loose,
      children: [
        GestureDetector(
          onTap: () => widget.package.payment == 1
              ? setState(() {
                  context.read<CourierCubit>().addOrderId(widget.package.id!);
                })
              : null,
          child: FadeInUp(
            delay: Duration(milliseconds: widget.index * 100),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              margin: EdgeInsets.only(bottom: 20),
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: selectedOrders.contains(widget.package.id)
                    ? MyColors.mainOpacity
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: selectedOrders.contains(widget.package.id)
                        ? MyColors.mainColor
                        : MyColors.grey153,
                    width: selectedOrders.contains(widget.package.id) ? 2 : 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ySizedBox.h16,
                        Text(widget.package.store!,
                            style:
                                AppTextStyles.sanF600.copyWith(fontSize: 16)),
                        MySizedBox.h4,
                        Text(widget.package.date!,
                            style: AppTextStyles.sanF400Grey),
                        // MySizedBox.h16,
                      ],
                    ),
                  ),
                  Text("${widget.package.price!} TL",
                      style: AppTextStyles.sanF600.copyWith(fontSize: 16)),
                  MySizedBox.w20,
                  OrderSelectIndicator(
                    active: selectedOrders.contains(widget.package.id),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: WidgetOrEmpty(
            value: widget.package.payment == 0,
            child: InkWrapper(
              onTap: () => Alert.show(context,
                  image: Icon(
                    Icons.info,
                    size: 80,
                  ),
                  title: MyText.youHaveNotPay,
                  secondButton: CaspaButton(
                    text: MyText.pay,
                    color: MyColors.grey245,
                    textColor: MyColors.black,
                    onTap: () {
                      Go.pop(context);
                      return Go.to(context,
                          Pager.packageDetails(package: widget.package));
                    },
                  ),
                  content: MyText.youMustHaveMakepayment),
              child: Container(
                color: MyColors.white70,
              ),
            ),
          ),
        )
      ],
    );
  }
}
