import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/user_id.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_photo.dart';
import 'user_name.dart';

class CabinetHeaderWidget extends StatelessWidget {
  const CabinetHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePhoto(),
        MySizedBox.h16,
        UserName(),
        MySizedBox.h16,
        UserID(),
        MySizedBox.h16,
        SliverInfo(
          MyText.emergencyCall,
          align: TextAlign.center,
        ),
        MySizedBox.h16,
      ],
    );
  }
}
