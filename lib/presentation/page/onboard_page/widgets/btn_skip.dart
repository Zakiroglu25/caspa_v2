import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

class ButtonSkip extends StatelessWidget {
  final index;
  ButtonSkip(this.index);
  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: index != 3,
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () => Go.andRemove(context, Pager.login),
          child: const Text(
            MyText.skip,
            style: TextStyle(color: MyColors.mainColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
