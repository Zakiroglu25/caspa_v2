import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final Function onTap;


  MoreButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CaspaTextButton(text: MyText.more,w: 50,
    );
  }
}
