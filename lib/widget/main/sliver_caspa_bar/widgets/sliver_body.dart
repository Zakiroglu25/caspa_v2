import 'package:flutter/material.dart';

class SliverBody extends StatelessWidget {
  final Widget? child;
  const SliverBody(this.child, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 100,
      child: child!,
    );
  }
}
