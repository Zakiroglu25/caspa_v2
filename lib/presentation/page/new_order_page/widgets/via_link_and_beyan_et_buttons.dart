
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/elements/menu_box.dart';
import 'package:flutter/material.dart';

class ViaLinkAndBeyanEtButtons extends StatelessWidget {
  const ViaLinkAndBeyanEtButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuBox(
          content: MyText.weBuyForYou,
          title: MyText.viaLink,
          color: MyColors.softGreen235,
          onTap: () => Go.to(context, Pager.viaLink),
        ),
        MenuBox(
          content: MyText.youMustBuyProduct,
          title: MyText.declareIt,
          color: MyColors.softPurple241,
          onTap: () => Go.to(context,Pager.report),
        ),
      ],
    );
  }
}
