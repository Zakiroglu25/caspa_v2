
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'caspa_drop_down.dart';
import 'drop_down_male.dart';

class CivilRegisterTab extends StatefulWidget {
  const CivilRegisterTab({Key? key}) : super(key: key);

  @override
  _CivilRegisterTabState createState() => _CivilRegisterTabState();
}

class _CivilRegisterTabState extends State<CivilRegisterTab> {
  var selectedDate = '~';
  late ValueNotifier<String> _gender = ValueNotifier('C');
  final formKey = GlobalKey<FormState>();

  final TextEditingController _civilName = TextEditingController();
  final TextEditingController _civilSurname = TextEditingController();
  final TextEditingController _civilNumber = TextEditingController();
  final TextEditingController _civilEmail = TextEditingController();
  final TextEditingController _civilAddress = TextEditingController();
  final TextEditingController _civilPassword = TextEditingController();
  final TextEditingController _civilConfrimPassword = TextEditingController();
  final TextEditingController _civilFin = TextEditingController();
  final TextEditingController _civilBirthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
   padding: Paddings.paddingH16,
      children: [
        MySizedBox.h24,
        CaspaTextFieldUnder("Ad"),
        CaspaField(
          hint: 'Adınızı daxil edin',
          controller: _civilName,
        ),
        CaspaTextFieldUnder("Soayd"),
        CaspaField(
          hint: 'Soyadınızı daxil edin',
          controller: _civilSurname,
        ),
        CaspaTextFieldUnder("Əlaqə nömrəsi"),
        CaspaField(
          hint: 'Əlaqə nömrəsi',
          controller: _civilNumber,
          textInputType: TextInputType.number,
        ),
        CaspaTextFieldUnder("Email"),
        CaspaField(
          hint: 'Email',
          controller: _civilEmail,
          textInputType: TextInputType.emailAddress,
        ),
        CaspaTextFieldUnder("Ünvan"),
        CaspaField(
          hint: 'Ünvan',
          controller: _civilAddress,
        ),
        CaspaTextFieldUnder("Anbar"),
        CustomDropDown(),
        CaspaTextFieldUnder("Şifrə"),
        CaspaField(
          hint: 'Şifrə',
          controller: _civilPassword,
          textInputType: TextInputType.visiblePassword,
        ),
        CaspaTextFieldUnder("Şifrə təsdiqlə"),
        CaspaField(
          hint: 'Şifrəni təsdiqlə',
          controller: _civilConfrimPassword,
          textInputType: TextInputType.visiblePassword,
        ),
        CaspaTextFieldUnder("FİN"),
        CaspaField(
          hint: 'Fin',
          controller: _civilFin,
        ),
        CaspaTextFieldUnder("Doğum tarixi"),
        CaspaField(
          hint: 'Doğum tarixi',
          controller: _civilBirthday,
        ),
        CaspaTextFieldUnder("Cinsiyyət"),
        DropDownGender(),
        MySizedBox.h30,
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(343, 52),
                primary: MyColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {
             // registration();
            },
            child: const Text(
              "Qeydiyyat",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        MySizedBox.h30,
      ],
    );
  }
}

void snackBarOpen(String message, BuildContext context,
    {Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}