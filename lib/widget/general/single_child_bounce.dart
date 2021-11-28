import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';

class SingleChildBounce extends StatelessWidget {
  final Widget ? child;
  final EdgeInsets ? padding;



  SingleChildBounce({required this.child,this.padding});

  @override
  Widget build(BuildContext context) {
    return         SingleChildScrollView(
      physics: Physics.alwaysBounce,
      padding: padding,
      child: child!,
    );
  }
}
