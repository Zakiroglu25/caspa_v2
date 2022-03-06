import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationTitle extends StatelessWidget {
  final String title;

  NotificationTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.sanF600
          .copyWith(fontSize: 16, color: MyColors.halfBlack),
    );
  }
}
