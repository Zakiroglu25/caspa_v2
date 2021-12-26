import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:flutter/material.dart';

class SuccessAgainButton extends StatelessWidget {

  final Widget? againPage;


  SuccessAgainButton({this.againPage});

  @override
  Widget build(BuildContext context) {
    return               WidgetOrEmpty(
      value: againPage!=null,
      child: CaspaTextButton(
        w: 100,
        color: MyColors.mainColor,
        textColor: MyColors.mainColor,
        text: MyText.again_process,
        onTap: ()=>Go.replace(context, againPage!),
      ),
    );
  }
}
