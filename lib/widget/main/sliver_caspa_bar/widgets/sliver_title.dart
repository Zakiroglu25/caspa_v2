// import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/app_text_styles.dart';

class SliverTitle extends StatelessWidget {
  final String? title;

  const SliverTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title!,
        softWrap: true,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.coHead400
            .copyWith(color: Colors.black, fontSize: 18));
  }
}
