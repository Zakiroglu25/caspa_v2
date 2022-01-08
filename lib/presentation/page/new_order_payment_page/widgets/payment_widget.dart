import 'package:caspa_v2/infrastructure/cubits/payment/payment_cubit.dart';
import 'package:caspa_v2/infrastructure/models/local/payments.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/kuryer_page/widgets/order_select_indicator.dart';
import 'package:caspa_v2/presentation/page/new_order_payment_page/widgets/payment_unicorn.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'from_my_balance_choice.dart';

class PaymentWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  Widget? child;
  bool selected;

  //PaymentTypeModel paymentTypeModel;

  PaymentWidget({required this.title, this.child,required this.selected,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWrapper(
          onTap: ()=> onTap.call(),
          child: SectionName(
            title: title,
            size: 16,
            tile: OrderSelectIndicator(
              active: selected,
              w: 20,
              h: 20,
            ),
          ),
        ),
        MySizedBox.h16,
        WidgetOrEmpty(value: child!=null, child: PaymentUnicorn(child: child??Container())),
        MySizedBox.h30,
      ],
    );
  }
}
