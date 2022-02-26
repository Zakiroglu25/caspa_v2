import 'package:caspa_v2/presentation/page/new_order_payment_page/widgets/payment_types_listwiev.dart';
import 'package:caspa_v2/presentation/page/success_page/success_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/section_name_and_definition.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final String price;

  PaymentPage({required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.new_order,
        user: false,
        contextA: context,
        notification: false,
      ),
      body: ListView(
        padding: Paddings.paddingA16,
        children: [
          Text(
            MyText.step + " 2/2",
            style: UITextStyle.tW400BigBlack,
          ),
          MySizedBox.h26,
          //error verdi deye Asset. elemedim
          SectionNameAndDefinition(
            definition: MyText.weAdviceSaveMoneyOnBalance,
            imagePath: Assets.pngPosTerminal,
            name: MyText.makePayment,
          ),
          MySizedBox.h40,
          PaymentTypesListView(),
          CaspaButton(
            text: MyText.goOn + " ${price}" + "",
            onTap: () {
              Go.to(context, SuccessPage());
            },
          ),
          MySizedBox.h32,
        ],
      ),
    );
  }
}
