import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/user_id.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'change_profile_button.dart';
import 'profile_photo.dart';
import 'user_name.dart';

class CabinetHeaderWidget extends StatelessWidget {
  const CabinetHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfullBackImage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MySizedBox.h32,
          ProfilePhoto(),
          MySizedBox.h16,
          UserName(),
          MySizedBox.h16,
          UserID(),

          ///user elave et buttonu
          MySizedBox.h16,
          ChangeProfileButton()
        ],
      ),
    );
  }
}
