import 'package:flutter/material.dart';

class SliverBack extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return                                 Positioned(
      left: 0,
      top: 8,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Container(
            height: 30, width: 30, child: BackButton()),
      ),
    );
  }
}
