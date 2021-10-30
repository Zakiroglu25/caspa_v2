import 'package:animate_do/animate_do.dart';
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
  final double? borderRadius;
  final double? textSize;
  final Function? onTap;
  final FontWeight? fontWeight;
  final String? text;
  final Widget? child;
  final double? w;
  final bool? loading;
  final double? h;

  CaspaButton(
      {this.color,
      this.loading,
      this.child,
      this.h,
      this.textSize,
      this.fontWeight,
      this.highlightColor,
      this.splashColor,
      this.w,
      this.textColor,
      this.onTap,
      this.borderRadius,
      this.text,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h ?? 52,
      width: w ?? double.infinity,
      decoration: BoxDecoration(
          color: color ?? MyColors.mainColor,
          border:
              Border.all(color: borderColor ?? (color ?? MyColors.mainColor)),
          borderRadius: BorderRadius.circular(borderRadius ?? 12)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap?.call(),
          highlightColor: highlightColor ?? MyColors.white.withOpacity(0.3),
          splashColor: splashColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          child: Center(
            child: (loading ?? false)
                ? CaspaLoading()
                : (child ??
                    Text(
                      text ?? "",
                      style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontSize: textSize ?? 18,
                          fontWeight: fontWeight ?? FontWeight.w400),
                    )),
          ),
        ),
      ),
    );
  }
}
