import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/via_link_and_beyan_et_buttons.dart';

class NewOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
      ),
      body: ListView(
        padding: Paddings.paddingH16 + Paddings.paddingT14,
        children: <Widget>[
          ColorfullBackImage(
            path: Assets.pngSebet,
            title: MyText.newOrder,
          ),
          ViaLinkAndBeyanEtButtons()
        ],
      ),
    );
  }
}
