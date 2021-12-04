import 'package:cached_network_image/cached_network_image.dart';
import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID:" + " C11111",
              style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
            ),
            //Text("C11111"),
            MySizedBox.w16,
            CopyButton(
              'C11111',
              h: 24.sm,
              w: 24.sm,
            ),
          ],
        ),
        MySizedBox.h16,
        SliverInfo(MyText.emergencyCall),
        MySizedBox.h16,
      ],
    );
  }
}
