import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';

class LocationButtonText extends StatelessWidget {
  const LocationButtonText({Key? key, this.text}) : super(key: key);

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FadeIn(
        child: Text(
          text ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: AppTextStyles.sanF500
              .copyWith(color: MyColors.white, fontSize: 12),
        ),
      ),
    );
  }
}
