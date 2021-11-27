import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DeclareTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: Paddings.paddingH16 +
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          children: [

          ],
        ),
      ],
    );
  }
}
