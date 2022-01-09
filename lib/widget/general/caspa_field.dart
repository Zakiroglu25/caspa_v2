import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/formatter/lower_case_formatter.dart';
import 'package:caspa_v2/util/formatter/upper_case_formatter.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CaspaField extends StatelessWidget {
 final TextEditingController? controller;
 final String? label;
 final String? hint;
 final String? title;
 final String? errorMessage;
 final String? infoMessage;
 final int? maxLenght;
 final int? maxLines;
 final double? topMargin;
 final TextCapitalization? textCapitalization;
  bool? obscure = false;
  bool? readOnly = false;
 final bool? upperCase;
 final List<TextInputFormatter>? formatters;
 final ValueChanged<String>? onChanged;
 final Function? onTap;
 final Widget? prefixIcon;
 final Widget? suffixIcon;
 final String? suffixText;
 final TextInputType? textInputType;

  CaspaField(
      {this.controller,
      this.label,
      this.hint,
      this.maxLenght,
      this.topMargin,
      this.maxLines,
      this.obscure,
      this.readOnly,
      this.upperCase,
      this.formatters,
      this.suffixIcon,
      this.title,
      this.infoMessage,
      this.errorMessage,
      this.textCapitalization,
      this.onChanged,
      this.onTap,
      this.prefixIcon,
      this.suffixText,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height:(errorMessage==null ? 90:110)+(infoMessage!=null? 18.0:0.0),
     // color: MyColors.mainRED,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height:topMargin?? 6,),
          Text(
            title ?? "",
            style: TextStyle(
                fontSize: 14,
                color: MyColors.grey153,
                fontFamily: "San Francisco"),
          ),
          MySizedBox.h3,
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                height: 50,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: errorMessage==null?MyColors.transparent: MyColors.errorRED)
                ),
                child: TextField(
                  autocorrect: false,
                  controller: controller,
                  obscureText: obscure ?? false,
                  maxLength: maxLenght,
                  maxLines: maxLines ?? null,
                  onChanged: onChanged,
                  readOnly: readOnly ?? false,
               //   enabled: false,
                  expands: maxLines != null ? false : true,
                  onTap: () => onTap?.call(),
                  keyboardType: textInputType ?? TextInputType.text,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.sentences,
                  inputFormatters: [
                    (upperCase ?? true) == true
                        ? UpperCaseFormatter()
                        : LowerCaseInputFormatter(),
                    ...?formatters
                  ],
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: hint ?? "",
                    hintStyle: AppTextStyles.sanF400.copyWith(fontSize: 16,
                    color: MyColors.grey153),
                    suffixText: suffixText ?? "",
                    filled: true,
                    prefixIcon: prefixIcon,
                    fillColor: MyColors.mainGrey,
                    contentPadding: EdgeInsets.only(
                        left: 14.0,
                        bottom: 6.0,
                        top: 8.0,
                        right: (suffixIcon != null) ? 40 : 0),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  color:MyColors.mainGrey,
                  padding: const EdgeInsets.only(right: 8),
                  margin: const EdgeInsets.only(right: 2),
                  child: Tooltip(
                    message: errorMessage ?? "",
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            //  vertical: errorMessage == null ? 18 : 17,
                            horizontal: 2),
                        child: suffixIcon ??
                            (errorMessage != null
                                ? Container(
                                    height: 20,
                                 //   color:MyColors.grey153,
                                    child: SvgPicture.asset(Assets.svgMinus))
                                : Container()),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          MySizedBox.h3,
          WidgetOrEmpty(
            value: errorMessage != null,
            child: FadeIn(
              key: Key("b"),
              child: Text(
                errorMessage ?? "",
                style: AppTextStyles.sanF400.copyWith(color: MyColors.errorRED),
              ),
            ),
            elseChild: FadeIn(
              key: Key("a"),
              child: Text(
                (infoMessage ?? ""),
                style: AppTextStyles.sanF400.copyWith(color: MyColors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
