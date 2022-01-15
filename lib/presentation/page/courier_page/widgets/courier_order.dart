import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import 'order_select_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierOrder extends StatefulWidget {
  Function? onTap;
  Package package;
  List<dynamic>? selectedOrders;
  int index;

  CourierOrder(
      {this.onTap,
      required this.package,
      this.selectedOrders,
      required this.index});

  @override
  State<CourierOrder> createState() => _CourierOrderState();
}

class _CourierOrderState extends State<CourierOrder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          context.read<CourierCubit>().addOrderId(widget.package.id!);
        });
      },
      child: FadeInUp(
        delay: Duration(milliseconds: widget.index * 100),
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          margin: EdgeInsets.only(bottom: 20),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: widget.selectedOrders!.contains(widget.package.id)
                ? MyColors.mainOpacity
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: widget.selectedOrders!.contains(widget.package.id)
                    ? MyColors.mainColor
                    : MyColors.grey153,
                width:
                    widget.selectedOrders!.contains(widget.package.id) ? 2 : 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ySizedBox.h16,
                    Text(widget.package.store!,
                        style: AppTextStyles.sanF600.copyWith(fontSize: 16)),
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
                active: widget.selectedOrders!.contains(widget.package.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
