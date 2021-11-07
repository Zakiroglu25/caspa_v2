import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_state.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/stepper.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
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
    final forgotCubit = context.watch<ForgotPassCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          padding: Paddings.paddingH20,
          child: Stack(
            children: [
              Column(
                children: [
                  MySizedBox.h60,
                  Container(
                      height: 100,
                      width: 100,
                      // color: Colors.green,
                      child: Image.asset('assets/png/qifil.png')),
                  MySizedBox.h10,
                  ForgotPassStepper(
                    stepCount: 4,
                    current: forgotCubit.currentIndex,
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
                                    .changeState(back: true, context: context);
                              },
                            )
                          ],
                        ),
                      );
                    }
                  })
                ],
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    CaspaButton(
                      text: MyText.back,
                      onTap: () {
                        context
                            .read<ForgotPassCubit>()
                            .changeState(back: true, context: context);
                      },
                    ),
                    MySizedBox.h16,
                    CaspaButton(
                      text: forgotCubit.buttonText,
                      onTap: () {
                        context
                            .read<ForgotPassCubit>()
                            .changeState(context: context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
