import 'package:caspa_v2/widget/caspa_appbar/widgets/user_button.dart';
import 'package:flutter/material.dart';

class SliverBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 4,
      child: UserButton(),
    );
  }
}
