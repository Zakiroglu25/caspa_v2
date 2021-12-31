import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/general/colorfull_bordered.dart';
import 'package:flutter/material.dart';

class PaymentUnicorn extends StatelessWidget {
  final Widget child;


  PaymentUnicorn({required this.child});

  @override
  Widget build(BuildContext context) {
    return               UnicornOutlineButton(
      strokeWidth: 1.5,
      radius: 16,
      padding: Paddings.paddingH20 + Paddings.paddingV20,
      gradient: const LinearGradient(colors: [
        MyColors.gradientBlue,
        MyColors.gradientCyan,
        MyColors.gradientRed,
        MyColors.gradientOrange,
      ]),
      onPressed: () {},
      child: child,
    );
  }
}
