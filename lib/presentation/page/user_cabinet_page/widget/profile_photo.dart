import 'package:cached_network_image/cached_network_image.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/user_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../locator.dart';

class ProfilePhoto extends StatelessWidget {
  PreferencesService get _prefs => locator<PreferencesService>();

  final double? w;
  final double? h;
  final bool? editable;

  ProfilePhoto({this.w, this.h, this.editable});

  @override
  Widget build(BuildContext context) {


    return Stack(

      children: [
        UserPhoto(),
        Positioned(
          bottom: 0,right: 2,
          child: WidgetOrEmpty(
              value: (editable??false), child: Container(
            height: 36.sm,
              width: 36.sm,
             decoration: BoxDecoration(
               color: MyColors.mainColor,
               borderRadius: BorderRadius.circular(36.sm)
             ),
              padding: Paddings.paddingA4,
              child: Center(
                child: Container(

                    height: 20.sm,
                    width: 20.sm,

                    child: SvgPicture.asset(Assets.svgCamera)),
              ))),
        )
      ],
    );
  }
}
