
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'caspa_drop_down.dart';
import 'drop_down_male.dart';

class CivilRegisterPage extends StatefulWidget {
  const CivilRegisterPage({Key? key}) : super(key: key);

  @override
  _CivilRegisterPageState createState() => _CivilRegisterPageState();
}

class _CivilRegisterPageState extends State<CivilRegisterPage> {
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

  // Future<void> registration() async {
  //   RegisterRepository authRepository = RegisterRepository();
  //   RegisterRequestModel registerReqModel = RegisterRequestModel(
  //       name: _civilName.text,
  //       surname: _civilSurname.text,
  //       email: _civilEmail.text,
  //       birthday: selectedDate,
  //       gender: _gender.value,
  //       phone: "number",
  //       id_number: _civilFin.text,
  //       wareHouse: 1,
  //       accept: 1,
  //       address: _civilAddress.text,
  //       fin: _civilFin.text,
  //       password: _civilConfrimPassword.text,
  //       password_confirmation: _civilConfrimPassword.text
  //       //deviceId: deviceId,
  //       // deviceType: deviceType);
  //       );
  //
  //   RegisterResponseModel response =
  //       (await authRepository.registerCivil(registerReqModel));
  //   log("6");
  //
  //   if (response.message =="The given data was invalid" ) {
  //     Go.to(context, LoginPage());
  //   } else {
  //     snackBarOpen("egor", context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
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
