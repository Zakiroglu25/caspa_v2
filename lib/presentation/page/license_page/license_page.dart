import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

class LicensePageX extends StatelessWidget {
  const LicensePageX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        contextA: context,
        title: MyText.app_license,
        notification: false,
      ),
      body: ListView(
        padding: Paddings.paddingA16 + Paddings.paddingB24,
        children: [
          Text(MyText.licenseText),
        ],
      ),
    );
  }
}
