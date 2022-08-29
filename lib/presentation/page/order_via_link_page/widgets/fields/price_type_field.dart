import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:flutter/material.dart';

class PriceTypeFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController? controller;

  PriceTypeFieldOrderViaUrl({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 1.5) -
            32,
        child: Sheet.display(
            context: context,
            child: SizedBox(height: 80, child: Text("a.fnlkas"))));
  }
}
