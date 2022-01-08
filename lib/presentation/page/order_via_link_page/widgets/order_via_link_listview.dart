import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/section_name_and_definition.dart';
import 'package:flutter/material.dart';

import 'commission_zero.dart';
import 'fields/count_field.dart';
import 'fields/link_field.dart';
import 'fields/local_cargo_field.dart';
import 'fields/note_field.dart';
import 'fields/price_field.dart';
import 'order_via_link_continue_button.dart';

class OrderViaLinkListview extends StatelessWidget {
  const OrderViaLinkListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Paddings.paddingA16,
      children: [
        Text(
          MyText.step + " 1/2",
          style: AppTextStyles.coHead500.copyWith(fontSize: 25),
        ),
        MySizedBox.h16,
        SectionNameAndDefinition(
          imagePath: Assets.linkGirl,
          name: MyText.addProduct,
          definition: MyText.declareText,
        ),
        MySizedBox.h16,
        LinkFieldOrderViaUrl(),
        CountFieldOrderViaUrl(),
        PriceFieldOrderViaUrl(),
        CommissionZero(),
        MySizedBox.h16,
        LocalCargoFieldOrderViaUrl(),
        NoteFieldOrderViaUrl(),
        MySizedBox.h16,
        OrderViaLinkContinueButton(),
        MySizedBox.h32,
      ],
    );
  }
}
