import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomElement extends StatelessWidget {
  String? asset;


  BottomElement(this.asset);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        padding: EdgeInsets.only(bottom: 5),
        //color: Colors.blue,
        child: SvgPicture.asset(asset!));
  }
}
