import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';

import 'caspa_drop_down.dart';
import 'drop_down_male.dart';

class BusinessRegisterPage extends StatefulWidget {
  const BusinessRegisterPage({Key? key}) : super(key: key);

  @override
  _BusinessRegisterPageState createState() => _BusinessRegisterPageState();
}

class _BusinessRegisterPageState extends State<BusinessRegisterPage> {
  final TextEditingController _businessName = TextEditingController();
  final TextEditingController _voen = TextEditingController();
  final TextEditingController _businessPersonalName = TextEditingController();
  final TextEditingController _businessPersonalSurName = TextEditingController();
  final TextEditingController _businessAddress = TextEditingController();
  final TextEditingController _businessEmail = TextEditingController();
  final TextEditingController _businessNumber = TextEditingController();
  final TextEditingController _businessPassword = TextEditingController();
  final TextEditingController _businessConfrimPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizedBox.h24,
          CaspaTextFieldUnder("Şirkətin Adı"),
          CaspaField(
            hint: 'Ad',
            controller: _businessName,
          ),
          CaspaTextFieldUnder("Şirkət nümayəndəsinin adı"),
          CaspaField(
            hint: 'Nümayəndə adı',
            controller: _businessPersonalName,
          ),
          CaspaTextFieldUnder("Şirkət nümayəndəsinin soyadı "),
          CaspaField(
            hint: 'Nümayəndə soyadı',
            controller: _businessPersonalSurName,
          ),
          CaspaTextFieldUnder("VÖEN"),
          CaspaField(
            hint: 'VÖEN',
            controller: _businessEmail,
          ),
          CaspaTextFieldUnder("Ünvan"),
          CaspaField(
            hint: 'Ünvan',
            controller: _businessAddress,
          ),
          CaspaTextFieldUnder("Email"),
          CaspaField(
            hint: 'Email',
            controller: _businessEmail,
            textInputType: TextInputType.emailAddress,

          ),
          CaspaTextFieldUnder("Telefon"),
          CaspaField(
            hint: 'Telefon',
            controller: _businessNumber,
            textInputType: TextInputType.number,
          ),
          CaspaTextFieldUnder("Şifrə"),
          CaspaField(
            hint: 'Şifrə',
            controller: _businessPassword,
            textInputType: TextInputType.visiblePassword,
          ),
          CaspaTextFieldUnder("Şifrə təsdiqlə"),
          CaspaField(
            hint: 'Şifrəni təsdiqlə',
            controller: _businessConfrimPassword,
            textInputType: TextInputType.visiblePassword,
          ),

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
                // if (_formKey.currentState!.validate()) {
                //   debugPrint("Valid");
              },
              child: const Text(
                "Qeydiyyatdan keç",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          MySizedBox.h30,

        ],
      ),
    );
  }
}
