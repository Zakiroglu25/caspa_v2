import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../util/delegate/date_operations.dart';
import 'new_balans_box.dart';

class WheelBalanceBox extends StatelessWidget {
  const WheelBalanceBox({Key? key, required this.user}) : super(key: key);
  final MyUser user;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: !DateOperations.isWeekCompleted(user.wheelTime!),
      child: NewBalanceBox(
        onTap: () => Go.to(context, Pager.wheel),
        icon: Assets.pngNote,
        boxTitle: MyText.wheel,
        title: "${MyText.balance}: ${user.balance} ${MyText.tryy} ",
        subtitle: MyText.giftBalance,
        subtitleColor: MyColors.balanceBoxRedAlternativ,
        desc: MyText.desc,
        color: MyColors.balanceBoxOrange.withOpacity(.2),
      ),
    );
  }
}
