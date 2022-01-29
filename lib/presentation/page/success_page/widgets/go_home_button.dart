import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/fade_raised_button.dart';
import 'package:flutter/material.dart';

class GoHomeButton extends StatelessWidget {
  const GoHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: FadeRaisedButton(
          onTap: () => Go.andRemove(context, Pager.app(showSplash: false)),
          title: MyText.goToHomePage,
        ));
  }
}
