import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/locator.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/adress_field.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/birthday_field.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/email_field.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/finField.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/main_pass_field.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/number_field.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/widgets/fields/second_pass_field.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/boxx.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';

import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'fields/anbar_field.dart';
import 'fields/cardIdField.dart';
import 'fields/company_field.dart';
import 'fields/tax_field.dart';

class SliverFields extends StatelessWidget {
  const SliverFields({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: Paddings.paddingH12 + Paddings.paddingV20 + Paddings.paddingB50,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SectionName(
              title: MyText.main,
              vP: 16,
            ),
            CaspaField(
              title: MyText.name,
              readOnly: true,
              hint: _prefs.user.name,
            ),
            CaspaField(
              title: MyText.surname,
              readOnly: true,
              hint: _prefs.user.surname,
            ),

            SectionName(
              title: MyText.technicInfo,
              vP: 16,
            ),
            PhoneFieldUser(
              controller:
                  StringOperations.stringToControllerPhone(_prefs.user.phone),
            ),
            EmailFieldUser(
                controller:
                    StringOperations.stringToController(_prefs.user.email)),
            BirthdayFieldUser(
              controller:
                  StringOperations.stringToController(_prefs.user.birthday),
            ),
            FinFieldUser(
                controller:
                    StringOperations.stringToController(_prefs.user.fin)),
            CardIdFieldUser(
                controller:
                    StringOperations.stringToController(_prefs.user.idNumber)),
            // AnbarFieldUser(),
            TaxFieldUser(),
            // CompanyFieldUser(),
            AdressFieldUser(
                controller:
                    StringOperations.stringToController(_prefs.user.address)),
            CaspaField(
              title: MyText.currentPass,
              readOnly: true,
              hint: '*******',
            ),
            MainPassFieldUser(),
            SecondPassFieldUser(),
            MySizedBox.h20,
          ],
        ),
      ),
    );
  }
}
