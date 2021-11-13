import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'close_button.dart';
import 'confirm_button.dart';
import 'title_text.dart';

class TitleAndRowButtons extends StatelessWidget {
  final Function?onConfirm;
  final bool    ?showCloseButton;
  final bool    ? showConfirmButton;
  final String  ?title;

  TitleAndRowButtons(
      {this.onConfirm,
      this.showCloseButton,
      this.showConfirmButton,
      this.title});

  @override
  Widget build(BuildContext context) {
    // showConfirmButton=true;
    //showCloseButton=false;
    return Container(
      //  color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (showCloseButton ?? true) ? BottomCloseButton() : MySizedBox.w80,
          title != null ? TitleText(title!) : Container(),
          (showConfirmButton ?? true)
              ? ConfirmButton(() => onConfirm?.call())
              : MySizedBox.w75
        ],
      ),
    );
  }
}
