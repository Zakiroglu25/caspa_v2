import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/sized_box.dart';

class CabinetMenuItem extends StatelessWidget {
  const CabinetMenuItem({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      child: Row(
        children: [
          icon,
          MySizedBox.w20,
          Text(
            title,
            style: AppTextStyles.sanF500
                .copyWith(color: Colors.black, fontSize: 16.sp),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
