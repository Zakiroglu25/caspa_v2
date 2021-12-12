import 'dart:async';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/state_full_wrapper.dart';
import 'package:caspa_v2/widget/general/caspa_logo_with_name.dart';
import 'package:flutter/material.dart';
import 'widgets/caspa_az_text.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        Timer(
            const Duration(seconds: 3),
            () =>
                Go.replace(context,  Pager.onBoard));
      },
      child: Scaffold(
        backgroundColor: MyColors.mainColor,
        body: SafeArea(
            child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [CaspaLogoWithName(), CaspaAzText()],
          ),
        )),
      ),
    );
  }
}
