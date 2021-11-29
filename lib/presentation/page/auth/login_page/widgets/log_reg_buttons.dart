import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_state.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogRegButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loginButton(context),
        MySizedBox.h16,
        registerButton(context),
        MySizedBox.h50,
      ],
    );
  }

  Widget loginButton(BuildContext context) {
    return CaspaButton(
      onTap: () {
        context.read<LoginCubit>().testLogin(context);
      },
      text: "login",
      loading:
      (context
          .watch<LoginCubit>()
          .state is LoginInProgress) ? true : false,
    );
  }

  CaspaButton registerButton(BuildContext context) {
    return CaspaButton(
      color: MyColors.greyWhite,
      textColor: MyColors.black,
      // borderColor: MyColors.mainColor,
      onTap: () {
        //context.read<RegisterCubit>().register(context);
        Go.to(context, Pager.register);
      },
      text: "registration",
    );
  }
}
