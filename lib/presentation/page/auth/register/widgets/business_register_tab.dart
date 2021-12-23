import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/single_child_bounce.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';

import 'fields/adress_field.dart';
import 'fields/birthday_field.dart';
import 'fields/cardIdField.dart';
import 'fields/email_field.dart';
import 'fields/finField.dart';
import 'fields/gender_field.dart';
import 'fields/main_pass_field.dart';
import 'fields/name_field.dart';
import 'fields/number_field.dart';
import 'fields/second_pass_field.dart';
import 'fields/surname_field.dart';
import 'register_button.dart';

class BusinessRegisterTab extends StatefulWidget {
  const BusinessRegisterTab({Key? key}) : super(key: key);

  @override
  _BusinessRegisterTabState createState() => _BusinessRegisterTabState();
}

class _BusinessRegisterTabState extends State<BusinessRegisterTab> {
  final TextEditingController _businessName = TextEditingController();
  final TextEditingController _voen = TextEditingController();
  final TextEditingController _businessPersonalName = TextEditingController();
  final TextEditingController _businessPersonalSurName =
      TextEditingController();
  final TextEditingController _businessAddress = TextEditingController();
  final TextEditingController _businessEmail = TextEditingController();
  final TextEditingController _businessNumber = TextEditingController();
  final TextEditingController _businessPassword = TextEditingController();
  final TextEditingController _businessConfrimPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildBounce(
            padding: Paddings.paddingH16 +
                EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                MySizedBox.h24,
                NameFieldRegister(),
                MySizedBox.h3,
                SurNameFieldRegister(),
                MySizedBox.h3,
                PhoneFieldRegister(),
                MySizedBox.h3,
                EmailFieldRegister(),
                MySizedBox.h3,
                // BirthdayFieldRegister(),
                // MySizedBox.h3,
                AdressFieldRegister(),
                //MySizedBox.h3,
                //AnbarFieldRegister(),
                MySizedBox.h3,
                MainPassFieldRegister(),
                MySizedBox.h3,
                SecondPassFieldRegister(),
                MySizedBox.h3,
                FinFieldRegister(),
                MySizedBox.h3,
                CardIdFieldRegister(),
                MySizedBox.h3,
                GenderFieldRegister(),
                MySizedBox.h90,
              ],
            )),
        RegisterButton()
      ],
    );
  }
}
