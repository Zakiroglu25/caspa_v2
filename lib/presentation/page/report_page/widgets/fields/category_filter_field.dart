import 'package:flutter/material.dart';

import '../../../../../util/constants/paddings.dart';
import '../../../../../util/constants/text.dart';
import '../../../../../widget/general/caspa_field.dart';

class CategoryFilterField extends StatelessWidget {
  const CategoryFilterField(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH16,
      //  color: MyColors.green,
      height: 75,
      child: CaspaField(
        controller: controller,
        showTitle: false,
        hint: MyText.searchX,
        onChanged: onChanged,
      ),
    );
  }
}
