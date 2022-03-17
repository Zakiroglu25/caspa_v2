import 'package:flutter/material.dart';

import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/delegate/pager.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';

class CourierOrderButton extends StatelessWidget {
  const CourierOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CaspaButton(
      onTap: () => Go.to(context, Pager.courier()),
      w: 154,
      h: 52,
      text: MyText.courierOrderX,
      textSize: 14,
      borderRadius: 100,
    );
  }
}
