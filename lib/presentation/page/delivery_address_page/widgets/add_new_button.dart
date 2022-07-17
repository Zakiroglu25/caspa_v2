import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/screen/ink_wrapper.dart';

class AddNewAdressButton extends StatelessWidget {
  const AddNewAdressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWrapper(
        onTap: null,
        child: Container(
            width: 165,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.mainOpacity),
            child: Center(
              child: Text(
                MyText.addNewAdress,
                style:
                    AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
              ),
            )),
      ),
    );
  }
}
