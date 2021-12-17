import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyBoxAnim extends StatelessWidget {
  const EmptyBoxAnim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Assets.animEmptyBox, repeat: false);
  }
}
