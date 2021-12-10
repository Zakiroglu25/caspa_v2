import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTopSmallImage extends StatelessWidget {
  final String path;

  PageTopSmallImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(width: 120.sm, height: 120.sm, child: Image.asset(path));
  }
}
