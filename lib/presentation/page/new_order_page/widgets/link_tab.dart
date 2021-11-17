import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/adress_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/birthday_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/cardIdField.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/email_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/finField.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/gender_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/main_pass_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/name_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/number_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/second_pass_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/surname_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/register_button.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LinkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: Paddings.paddingH16 +
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          children: [
            MySizedBox.h24,
            SectionName(title: "İnformasiya",),
            MySizedBox.h16,
            CaspaField(title: "Məhsulun linki",),
            CaspaField(title: "Məhsulun sayı",),
            //burda mehsul novu olacaq
            //burda ,ehsulun alt novu


          ],
        ),
      ],
    );
  }
}
