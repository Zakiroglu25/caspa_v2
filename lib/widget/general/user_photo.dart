import 'package:cached_network_image/cached_network_image.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../locator.dart';

class UserPhoto extends StatelessWidget {
  double? h;
  double? w;

  UserPhoto({this.h, this.w});

  PreferencesService get _prefs => locator<PreferencesService>();

  @override
  Widget build(BuildContext context) {
    return _prefs.user.avatar == null
        ? Container(
            height: h, width: w, child: SvgPicture.asset(Assets.svgUserCircle))
        : Container(
            height: h ?? 100.sp,
            width: w ?? 100.sp,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(100.sp)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.sp),
                child: ErrorableImage(
                    fit: BoxFit.cover,
                    url: (_prefs.user.avatar!
                        //+'?v=${DateTime.now().millisecondsSinceEpoch}'

                        ))));
  }
}
