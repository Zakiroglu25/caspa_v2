import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';

class CaspaButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final Function? onTap;
  final String? text;

  CaspaButton(
      {this.color, this.textColor, this.onTap,this.borderRadius, this.text, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
          color: color ?? MyColors.mainColor,
          border:
              Border.all(color: borderColor ?? (color ?? MyColors.mainColor)),
          borderRadius: BorderRadius.circular(borderRadius??12)),
      child: Material( color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap?.call(),
          highlightColor: MyColors.white.withOpacity(0.3),
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius??12),
          child: Center(
            child: Text(
              text ?? "",
              style: TextStyle(color: textColor ?? Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

