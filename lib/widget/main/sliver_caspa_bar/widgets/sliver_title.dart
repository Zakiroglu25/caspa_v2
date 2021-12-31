import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SliverTitle extends StatelessWidget {
 final  String? title;

  SliverTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //left: 0,
      //right: 0,
      top: 70,
      left: 20,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Text(title!,
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.coHead400
                .copyWith(color: Colors.black, fontSize: 25)),
      ),
    );
  }
}
