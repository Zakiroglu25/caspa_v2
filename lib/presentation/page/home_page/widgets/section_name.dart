import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  String? title;
  double? hP;
  double? vP;
  double? size;
  Widget? tile;
  int? maxLines;

  SectionName(
      {required this.title,
      this.vP,
      this.hP,
      this.size,
      this.tile,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: hP ?? 0, vertical: vP ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title!,
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
              style: UITextStyle.tW600Black.copyWith(fontSize: size ?? 16,letterSpacing: 0.3),
            ),
          ),
          WidgetOrEmpty(
            value: tile != null,
            child: tile,
          )
        ],
      ),
    );
  }
}
