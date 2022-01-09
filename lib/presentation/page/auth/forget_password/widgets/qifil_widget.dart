import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';

class QifilWidget extends StatelessWidget {
  const QifilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                   Container(
        height: 100,
        width: 100,
        child: Image.asset(Assets.pngQifil));
  }
}
