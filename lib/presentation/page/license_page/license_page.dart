import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

class LicensePageX extends StatelessWidget {
  const LicensePageX({Key? key, required this.text, required this.title})
      : super(key: key);
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        contextA: context,
        title: title,
        notification: false,
      ),
      body: ListView(
        padding: Paddings.paddingA16 + Paddings.paddingB24,
        children: [
          Text(text),
        ],
      ),
    );
  }
}
