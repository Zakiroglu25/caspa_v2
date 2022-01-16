import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_state.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/stepper.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/enter_code_body.dart';
import 'widgets/enter_mail_body.dart';
import 'widgets/forgot_main_button.dart';
import 'widgets/pass_changed_body.dart';
import 'widgets/qifil_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: CaspaAppbar(
        contextA: context,
        title: '',
        user: false,
        notification: false,
      ),
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          padding: Paddings.paddingH20,
          child: Stack(
            children: [
              Column(
                children: [
                  QifilWidget(),
                  MySizedBox.h10,
                  ForgotPassStepper(
                    stepCount: 3,
                    current: forgotCubit.currentIndex,
                  ),
                  BlocBuilder<ForgotPassCubit, ForgotPassState>(
                      buildWhen: (context, state) {
                    if (state is ForgotPassInProgress) {
                      return false;
                    }
                    if (state is ForgotPassError) {
                      return false;
                    } else
                      return true;
                  }, builder: (context, state) {
                    if (state is ForgotPassEnterMail) {
                      return FadeIn(key: Key("a"), child: EnterMailBody());
                    }
                    if (state is ForgotPassEnterCode) {
                      return FadeInRight(duration: Duration(milliseconds: 500),key: Key("b"), child: EnterCodeBody());
                    }
                    if (state is ForgotPassChanged) {
                      return FadeInRight(duration: Duration(milliseconds: 500),
                          key: Key("c"), child: PassChangedBody());
                    } else {
                      return CaspaLoading.blue();
                    }
                  })
                ],
              ),
              const ForgotMainButton()
            ],
          ),
        ),
      ),
    );
  }
}
