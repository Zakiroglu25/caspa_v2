import 'package:caspa_v2/presentation/page/package_page/widget/tab_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/my_printer.dart';

class PackageTab extends StatelessWidget {
  const PackageTab({Key? key, required this.count, required this.title})
      : super(key: key);
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    bbbb("ccchhh: $count");
    return Tab(
      //   text: entry.key,
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.sanF600
                .copyWith(fontSize: 15.sm, letterSpacing: 0.3),
          ),
          MySizedBox.w5,
          TabCount(count: count)
        ],
      ),
      height: 65,
    );
  }
}
