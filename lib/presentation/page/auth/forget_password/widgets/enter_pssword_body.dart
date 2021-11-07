import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_main_text.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_second_text.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

//class EnterPsswordBody extends StatelessWidget {

import 'package:flutter/material.dart';

//class EnterCodeBody extends StatelessWidget {

import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fields/code_field_forgot.dart';

class EnterPasswordBody extends StatelessWidget {
  const EnterPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH20,
      child: Column(
        children: [
          MySizedBox.h30,
          ForgotMainText(MyText.set_new_pass),
          MySizedBox.h16,
          ForgotSecondText(MyText.your_pass_reseted),
          MySizedBox.h16,
          // CodeFieldForgot(codeController),
        ],
      ),
    );
  }
}
