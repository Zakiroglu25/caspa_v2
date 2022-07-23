import 'package:flutter/material.dart';

import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/colors.dart';
import '../../../util/constants/paddings.dart';
import '../../../util/screen/ink_wrapper.dart';

class AccentButton extends StatelessWidget {
  const AccentButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  final VoidCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWrapper(
        onTap: onTap,
        child: Center(
          child: Container(
              padding: Paddings.paddingH16 + Paddings.paddingV12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.mainOpacity),
              child: Text(
                title ?? '',
                style:
                    AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
              )),
        ),
      ),
    );
  }
}
