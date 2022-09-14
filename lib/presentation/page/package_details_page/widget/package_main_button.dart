import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

class PackageMainButton extends StatelessWidget {
  const PackageMainButton(
      {Key? key, required this.text, required this.onTap, this.w})
      : super(key: key);

  final Function onTap;
  final String text;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: w,
        height: 45,
        child: CaspaButton(onTap: () => onTap.call(), text: text));
  }
}
