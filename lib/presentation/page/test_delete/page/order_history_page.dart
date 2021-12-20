import 'package:caspa_v2/presentation/page/test_delete/cubit/order_history_cubit.dart';
import 'package:caspa_v2/presentation/page/test_delete/cubit/order_history_state.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../order_history_model.dart';
import 'widget/order_history_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  List<OrderHistoryModel>? order_history_list;

  OrderHistoryPage({Key? key, required this.order_history_list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: [
              Container(
                height: 92.sp,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return MySizedBox.w10;
                  },
                  shrinkWrap: true,
                  itemCount: order_history_list!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    print("orderss");
                    OrderHistoryModel orderss = order_history_list![index];

                    ///burda ilishirem
                    ///bilmirem widgeti nece etmeliyem
                    return OrderHistoryWidget(
                      // clientName: orderss.orders[""]
                      // deliveryDate: order_history_list?[index].clientName,
                      // deliveryTimeTo: order_history_list?[index].clientName,
                      // deliveryStatus: order_history_list?[index].clientName,
                      // deliveryTimeFrom: order_history_list?[index].clientName,
                      // id: order_history_list?[index].id,
                      // totalPrice: order_history_list?[index].clientName,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
