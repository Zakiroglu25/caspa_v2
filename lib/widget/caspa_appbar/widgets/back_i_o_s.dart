import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class BackIOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.mainOrange,
          )),
    );
  }
}
