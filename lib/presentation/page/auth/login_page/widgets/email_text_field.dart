import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginEmailField extends StatelessWidget {

  final loginEmailController;
  LoginEmailField({this.loginEmailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: TextFormField(

        validator: (value) {
          if (value!.isEmpty) {
            return "Zehmet olmasa e-mailinizi daxil edin";
          }
          return null;
        },
        autofocus: false,
        style: TextStyle(fontSize: 15.0, color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            minHeight: 25,
            minWidth: 25,
          ),
          suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: SvgPicture.asset("assets/svg/check.svg")),
          hintText: 'Username',
          filled: true,
          fillColor: MyColors.mainGrey,
          contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
        ),
      ),
    );
  }
}
