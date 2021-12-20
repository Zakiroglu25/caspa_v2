import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';

class CaspaButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;
  final Color? passiveButtonColor;
  final Color? passiveTextColor;
  final double? borderRadius;
  final double? textSize;
  final Function? onTap;
  final FontWeight? fontWeight;
  final String? text;
  final Widget? child;
  final double? w;
  final bool? loading;
  late final bool? isButtonActive;
  final double? h;

  CaspaButton(
      {this.color,
      this.loading,
      this.child,
      this.h,
      this.textSize,
      this.fontWeight,
      this.isButtonActive,
      this.highlightColor,
      this.passiveTextColor,
      this.passiveButtonColor,
      this.splashColor,
      this.w,
      this.textColor,
      this.onTap,
      this.borderRadius,
      this.text,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    bool active = isButtonActive ?? true;
    return Container(
      height: h ?? 52,
      width: w ?? double.infinity,
      decoration: BoxDecoration(
          color: (active)
              ? (color ?? MyColors.mainColor)
              : (passiveButtonColor ?? MyColors.greyPassiveBodyMainColor),
          border: Border.all(
              color: active
                  ? (borderColor ?? (color ?? MyColors.mainColor))
                  : (passiveButtonColor ?? MyColors.greyPassiveBodyMainColor)),
          borderRadius: BorderRadius.circular(borderRadius ?? 12)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => (active) ? (onTap?.call()) : null,
          highlightColor: active
              ? (highlightColor ?? MyColors.white.withOpacity(0.3))
              : MyColors.transparent,
          splashColor: active
              ? (splashColor ?? Colors.transparent)
              : MyColors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          child: Center(
            child: (loading ?? false)
                ? CaspaLoading.white()
                : (child ??
                    Text(
                      text ?? "",
                      style: AppTextStyles.sanF400.copyWith(
                          color: active
                              ? (textColor ?? Colors.white)
                              : (passiveButtonColor ??
                                  MyColors.greyPassiveContentWhite),
                          fontSize: textSize ?? 18,
                          fontWeight: fontWeight ?? FontWeight.w400),
                    )),
          ),
        ),
      ),
    );
  }
}
