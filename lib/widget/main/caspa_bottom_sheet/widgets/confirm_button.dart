import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmButton extends StatelessWidget {
  final Function onConfirm;

  ConfirmButton(this.onConfirm);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextButton(
          onPressed: () {
            onConfirm.call();
            Navigator.pop(context);
          },
          child: Icon(
            FontAwesomeIcons.caretDown,
            color: MyColors.mainColor,
            size: 25,
          )),
    );
  }
}
