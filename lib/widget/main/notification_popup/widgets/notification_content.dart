import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
  final String content;

  NotificationContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      child: Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: AppTextStyles.sanF500
            .copyWith(fontSize: 13, color: MyColors.grey165),
      ),
    );
  }
}
