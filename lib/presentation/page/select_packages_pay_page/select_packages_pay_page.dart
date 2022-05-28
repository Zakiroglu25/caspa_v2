import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

class SelectPackagesPayPage extends StatefulWidget {
  const SelectPackagesPayPage({Key? key}) : super(key: key);

  @override
  State<SelectPackagesPayPage> createState() => _SelectPackagesPayPageState();
}

class _SelectPackagesPayPageState extends State<SelectPackagesPayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        title: '',
        contextA: context,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
