import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/positioned_bottom_fade.dart';
import 'package:caspa_v2/util/screen/positioned_fade.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/save_button.dart';
import 'widgets/sliver_fields.dart';
import 'widgets/sliver_user_photo.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.settings,
        contextA: context,
        notification: false,
        user: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: Physics.alwaysBounce,
              slivers: [
                SliverUserPhoto(),
                SliverFields(),
              ],
            ),
            PositionedTopFade(),
            PositionedBottomFade(),
            SaveButton()
          ],
        ),
      ),
    );
  }
}
