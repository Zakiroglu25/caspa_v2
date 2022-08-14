import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';

class MemberAddButton extends StatelessWidget {
  const MemberAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenuAction(
        //trailingIcon: Icons.add,
        onPressed: () => Go.to(context, Pager.login),
        isDefaultAction: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              MyText.add,
              style: AppTextStyles.sanF500
                  .copyWith(color: MyColors.mainColor, fontSize: 14.sm),
            ),
            MySizedBox.w2,
            Icon(
              Icons.add,
              size: 25,
              color: MyColors.mainColor,
            )
          ],
        ));
  }
}
