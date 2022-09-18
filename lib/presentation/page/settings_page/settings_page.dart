import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/setting_element.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.settingsX,
        centerTitle: true,
        user: false,
        contextA: context,
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 35),
        child: ListView(
          children: [
            SettingElement(
              onTap: () => Go.to(
                  context,
                  Pager.anyInfo(
                      text: MyText.rulesText, title: MyText.app_license)),
              title: MyText.app_license,
              svgPath: Assets.svgFile,
            ),
            MySizedBox.h45,
            SettingElement(
              onTap: () => Go.to(context, ContactPage()),
              title: MyText.help,
              svgPath: Assets.svgHelp,
            ),
            MySizedBox.h45,
            SettingElement(
              onTap: () => AppOperations.openNotificationSettings(),
              title: MyText.notificationSettings,
              svgPath: Assets.svgNotificationBell,
            ),
            MySizedBox.h45,
            SettingElement(
              onTap: () => Go.to(context, Pager.appInfo),
              title: MyText.about_app,
              svgPath: Assets.svgInfoApp,
            ),
          ],
        ),
      ),
    );
  }
}
