import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:flutter/material.dart';

class Boxx extends StatelessWidget {
  const Boxx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 90,width: 90,color: Rndm.color,padding: Paddings.paddingA4,);
  }
}
