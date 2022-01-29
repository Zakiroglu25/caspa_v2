import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SliverTitleTop extends StatelessWidget {
  final String? title;

  const SliverTitleTop(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //left: 0,
      //right: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0, top: 15),
        child: Text(title!,
            softWrap: true,
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400.copyWith(color: Colors.black)),
      ),
    );
  }
}
