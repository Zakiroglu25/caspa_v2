import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';

class PackageBoxDetailText extends StatelessWidget {
  const PackageBoxDetailText(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          title + ": ",
          style: AppTextStyles.sanF400
              .copyWith(fontSize: 12.sp, color: MyColors.grey153),
        ),
        Text(
          value ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.sanF400.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
