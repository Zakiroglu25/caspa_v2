import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/cubits/payment_balance/payment_balance_cubit.dart';

class PricePackage extends StatelessWidget {
  Function? onTap;

  //List<dynamic>? selectedOrders;
  int index;
  //final String title;
  //final String description;
  final String price;
  final String gift;

  PricePackage(
      {this.onTap,
      //    this.selectedOrders,
      // required this.title,
      required this.price,
      required this.gift,
      //required this.description,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<PaymentBalanceCubit>(context).updatePrice(price);
            context.read<PaymentBalanceCubit>().getPaymentUrl(context,
                paymentBalanceType: PaymentBalanceType.cargo);
          },
          child: BounceInUp(
            delay: Duration(milliseconds: index * 50),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              margin: EdgeInsets.only(bottom: 20),
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColors.mainColor, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ySizedBox.h16,
                        Text('$price USD + $gift USD',
                            style: AppTextStyles.sanF600
                                .copyWith(fontSize: 16.sp)),
                        MySizedBox.h4,
                        Text(
                            'Daşınma balansını $price USD artırdıqda, bonus balansınıza $gift USD hədiyyə olaraq əlavə olunacaqdır.',
                            style: AppTextStyles.sanF400Grey),
                        // MySizedBox.h16,
                      ],
                    ),
                  ),
                  // Text("$price USD",
                  //     style: AppTextStyles.sanF600.copyWith(fontSize: 16)),
                  MySizedBox.w20,
                  // OrderSelectIndicator(
                  //   active: selectedOrders.contains(widget.package.id),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
