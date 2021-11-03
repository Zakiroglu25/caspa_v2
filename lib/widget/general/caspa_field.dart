import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/formatter/lower_case_formatter.dart';
import 'package:caspa_v2/util/formatter/upper_case_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaspaField extends StatelessWidget {
  TextEditingController ?controller;
  String? label;
  String? hint;
  String? title;
  String? errorMessage;
  int? maxLenght;
  int? maxLines;
  TextCapitalization? textCapitalization;
  bool? obscure = false;
  bool? readOnly = false;
  bool? upperCase ;
  ValueChanged<String>? onChanged;
  Function? onTap;
  Widget? prefixIcon;
  Widget? suffixIcon;
  //String tip

  TextInputType? textInputType;

  CaspaField(
      {this.controller,
        this.label,
        this.hint,
        this.maxLenght,
        this.maxLines,
        this.obscure,
        this.readOnly,
        this.upperCase,
        this.suffixIcon,
        this.title,
        this.errorMessage,
        this.textCapitalization,

        this.onChanged,
        this.onTap,
        this.prefixIcon,
        this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title??"",
          style: TextStyle(
              fontSize: 14,
              color: MyColors.textFieldLittleText,
              fontFamily: "San Francisco"),
        ),
        MySizedBox.h3,
        Stack(alignment: Alignment.center,
          children: [
            Container(height: 50,
              child: TextField(
                autocorrect: false,
                controller: controller,
                obscureText: obscure??false,
                maxLength: maxLenght,
                maxLines: maxLines ?? null,
                onChanged: onChanged,
                readOnly: readOnly ?? false,
                expands: maxLines != null ? false : true,
                onTap: onTap?.call(),
                keyboardType: textInputType ?? TextInputType.text,
                textCapitalization: textCapitalization ?? TextCapitalization.sentences,
                inputFormatters: [
                  (upperCase ?? true) == true
                      ? UpperCaseFormatter()
                      : LowerCaseInputFormatter()
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),

                  hintText: hint ?? "",
                  filled: true,
                  fillColor: MyColors.mainGrey,
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Tooltip(
                message: errorMessage??"",
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      //  vertical: errorMessage == null ? 18 : 17,
                        horizontal: 2),
                    child: suffixIcon ??
                        (errorMessage != null
                            ? Container(

                            height: 20,
                            child: SvgPicture.asset(Assets.svgMinus))                          : Container()),
                  ),
                ),
              ),
            )

          ],
        ),
      ],
    );
  }
}
