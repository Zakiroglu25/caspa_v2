import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../infrastructure/services/hive_service.dart';
import '../../locator.dart';
import '../../util/constants/assets.dart';
import '../../util/screen/errorable_image.dart';
import '../../util/screen/widget_or_empty.dart';

class PhotoWithUrl extends StatefulWidget {
  PhotoWithUrl({Key? key, this.w, this.h}) : super(key: key);
  final double? h;
  final double? w;

  @override
  State<PhotoWithUrl> createState() => _PhotoWithUrlState();
}

class _PhotoWithUrlState extends State<PhotoWithUrl> {
  HiveService get _prefs => locator<HiveService>();
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        setState(() {});
      },
      child: WidgetOrEmpty(
          value: _prefs.user.avatar == null,
          child: Container(
              height: widget.h ?? 100.sp,
              width: widget.w ?? 100.sp,
              child: SvgPicture.asset(Assets.svgUserCircle)),
          elseChild:
              ErrorableImage(fit: BoxFit.cover, url: _prefs.user.avatar)),
    );
  }
}
