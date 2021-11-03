import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/fields/email_field_forgot.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/email_field.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterMailBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: double.maxFinite,
     // color: Colors.blue,
     // padding: Paddings.paddingH20,
      child: Stack(
        children: [
          Column(
            children: [
              MySizedBox.h16,
              EmailFieldForgot(emailController),
              Text(
                "EmailFieldForgot EmailFieldFor gotEmailFieldForgot EmailField",
                style: AppTextStyles.sanF400.copyWith(color: MyColors.orange),
              ),
              Container(
                child: Text(
                  "mail",
                  style: AppTextStyles.coHead600,
                ),
              ),
              CaspaButton(
                text: "back",
                onTap: () {
                  context
                      .read<ForgotPassCubit>()
                      .changeState(back: true, context: context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
