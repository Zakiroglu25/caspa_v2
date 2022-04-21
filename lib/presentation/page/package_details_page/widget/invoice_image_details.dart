import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

class InvoiceImageFullScreen extends StatelessWidget {
  const InvoiceImageFullScreen({Key? key, required this.package})
      : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: package.store,
        contextA: context,
        notification: false,
      ),
      body: ListView(
        children: [
          Hero(
            tag: 'full',
            child: Image.network(
              package.invoice.toString(),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
