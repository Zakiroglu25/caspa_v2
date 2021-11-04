import 'package:caspa_v2/presentation/page/address_page/widget/adress_sliver_body.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';

import 'package:flutter/material.dart';

import 'widget/turkey_anbar.dart';

class AdressPage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
    TurkeyAnbar(),
    Text('second'),
    Text('third')
  ];


  final List<Widget> tabs = const [
    Tab(
      text: 'Türkiyə',
      height: 60,
    ),
    Tab(
      text: 'Amerika',
    ),
    Tab(
      text: 'Çin',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
          child: SliverCaspaBar(
            tabs:tabs,
            tabPages: tabPages,
            title: '''Ünvanlar''',
            sliverChild: AdressSliverAppbarBody(),
          ),
        ));
  }
}
