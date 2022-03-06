import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/widget/general/caspa_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      // color: Colors.red,
      child: CaspaLogo(),
    );
  }
}
