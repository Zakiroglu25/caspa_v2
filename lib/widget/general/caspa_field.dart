import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/formatter/lower_case_formatter.dart';
import 'package:caspa_v2/util/formatter/upper_case_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaspaField extends StatelessWidget {
  TextEditingController ?controller;
  String? label;
  String? hint;
  int? maxLenght;
  int? maxLines;
  TextCapitalization? textCapitalization;
  bool? obscure = false;
  bool? readOnly = false;
  bool? upperCase = true;
  Function? onChanged;
  Function? onTap;
  Widget? prefixIcon;
  Widget? suffixIcon;
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

        this.onChanged,
        this.onTap,
        this.prefixIcon,
        this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16),
        child: TextField(
          autocorrect: false,
          controller: controller,
          obscureText: obscure??false,
          maxLength: maxLenght,
          maxLines: maxLines ?? null,
          onChanged: onChanged?.call(),
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
            suffixIconConstraints: BoxConstraints(
              minHeight: 25,
              minWidth: 25,
            ),
            suffixIcon: suffixIcon,
            hintText: hint ?? "",
            filled: true,
            fillColor: MyColors.mainGrey,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          ),
        ),
      ),
    );
  }
}
