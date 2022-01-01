import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/social_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        centerTitle: true,
        title: '',
        //MyText.contact,
        user: false,
        notification: false,
      ),
      body: ListView(
        padding: Paddings.paddingH16,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              MyText.applyToCustomerService,
              style: UITextStyle.tW400BigBlack,
            ),
          ),
          MySizedBox.h32,
          SocialItem(
            name: MyText.whatsapp,
            path: Assets.svgWhatsapp,
            onTap: () {},
          ),
          MySizedBox.h16,
          SocialItem(
            name: MyText.telegram,
            path: Assets.svgTelegram,
            onTap: () {},
          ),
          MySizedBox.h16,
          SocialItem(
            name: MyText.messenger,
            path: Assets.svgMessenger,
            onTap: () {},
          ),
          MySizedBox.h16,
          SocialItem(
            name: MyText.c1453,
            content: MyText.hot_contact,
            path: Assets.svgContact,
            onTap: () => StringOperations.launchCaller(MyText.c1453),
          ),
        ],
      ),
    );
  }
}
