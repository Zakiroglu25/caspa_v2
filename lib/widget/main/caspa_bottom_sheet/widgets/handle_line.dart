import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class HandleLine extends StatelessWidget {
  final double sW;

  HandleLine(this.sW);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (sW / 2) - 100),
      width: 33,
      height: 4,
      color: MyColors.grey226,
    );
  }
}
