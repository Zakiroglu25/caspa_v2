import 'package:flutter/material.dart';

import '../../../../util/constants/text.dart';
import '../../../../widget/custom/buttons/fade_raised_button.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: FadeRaisedButton(
          title: MyText.confirming,
        ));
  }
}
