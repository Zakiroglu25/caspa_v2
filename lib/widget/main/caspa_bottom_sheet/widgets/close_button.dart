import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(FontAwesomeIcons.caretLeft,color: MyColors.mainColor,
            size: 25,)),
    );
  }
}
