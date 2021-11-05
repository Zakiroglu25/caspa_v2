import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';

class SliverBody extends StatelessWidget {


  Widget? child;


  SliverBody(this.child);

  @override
  Widget build(BuildContext context) {
    return                             Positioned(
      left: 10,
      top: 100,
      child: child!,
    );
  }
}
