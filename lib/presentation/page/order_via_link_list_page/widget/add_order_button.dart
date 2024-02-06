import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';

class AddAttorneyButton extends StatelessWidget {
  const AddAttorneyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: MyText.newOrder,
      onTap: () => Go.to(context, Pager.orderViaLink()),
    );
  }
}
