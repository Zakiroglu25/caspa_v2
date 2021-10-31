import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_state.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/stepper.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/caspa_appbar/simple_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/enter_code_body.dart';
import 'widgets/enter_mail_body.dart';
import 'widgets/enter_pssword_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          child: Column(
            children: [
              ForgotPassStepper(
                stepCount: 4,
                current: context.watch<ForgotPassCubit>().currentIndex,
              ),
              BlocBuilder<ForgotPassCubit, ForgotPassState>(
                  builder: (context, state) {
                if (state is ForgotPassEnterMail) {
                  return EnterMailBody();
                }
                if (state is ForgotPassEnterCode) {
                  return EnterCodeBody();
                }
                if (state is ForgotPassNewPass) {
                  return EnterPasswordBody();
                } else {
                  return Container(
                    padding: Paddings.paddingH20,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "success",
                            style: AppTextStyles.coHead600,
                          ),
                        ),
                        CaspaButton(
                          text: "back",
                          onTap: () {
                            context
                                .read<ForgotPassCubit>()
                                .changeState(back: true,context: context);
                          },
                        )
                      ],
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
