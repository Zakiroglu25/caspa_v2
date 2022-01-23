import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:flutter/material.dart';

class Boxx extends StatelessWidget {
  final double? h;
  final double? w;

  Boxx({this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h ?? 90,
      width: w ?? 90,
      color: Rndm.color,
      padding: Paddings.paddingA4,
    );
  }
}
