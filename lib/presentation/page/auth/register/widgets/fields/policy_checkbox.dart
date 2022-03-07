import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../infrastructure/cubits/register/register_cubit.dart';
import '../../../../../../util/constants/app_text_styles.dart';
import '../../../../../../util/constants/colors.dart';
import '../../../../../../util/constants/text.dart';

class PolicyCheckbox extends StatelessWidget {
  const PolicyCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: BlocProvider.of<RegisterCubit>(context).checkBoxStream,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWrapper(
              onTap: () => Go.to(
                  context,
                  Pager.anyInfo(
                      text: MyText.rulesText,
                      title: MyText.userRulesandAgreements)),
              child: Text(
                MyText.iAgreeWithRules,
                style:
                    AppTextStyles.sanF600.copyWith(color: MyColors.mainColor),
              ),
            ),
            Checkbox(
                value: snapshot.data ?? false,
                checkColor: Colors.white, // color of tick Mark
                activeColor: MyColors.mainColor,
                onChanged: (v) {
                  BlocProvider.of<RegisterCubit>(context).updateCheckBox(v!);
                })
          ],
        );
      },
    );
  }
}
