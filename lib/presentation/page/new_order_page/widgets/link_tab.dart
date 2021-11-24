import 'package:caspa_v2/app.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Yeni sifariş",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
    );
  }
}
