import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

class AllPaymentPackages extends StatefulWidget {
  const AllPaymentPackages({Key? key}) : super(key: key);

  @override
  State<AllPaymentPackages> createState() => _AllPaymentPackagesState();
}

class _AllPaymentPackagesState extends State<AllPaymentPackages> {
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
        children: [

        ],
      ),
    );
  }
}
