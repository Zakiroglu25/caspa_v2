import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
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
        padding: Paddings.paddingH16,
        children: <Widget>[
          Text(
            MyText.newOrder,
            style: UITextStyle.tW400BigBlack,
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.pngColorfulBack),
                  ),
                ),
              ),
              Positioned(
                top: 65,
                left: 65,
                right: 65,
                child: SizedBox(
                  child: Image.asset(
                    Assets.pngSebet,
                  ),
                ),
              ),
            ],
          ),
          ViaLinkAndBeyanEtButtons()
        ],
      ),
    );
  }
}
