import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_state.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogRegButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      // color: MyColors.green,
      child: Column(
        children: [
          loginButton(context),
          MySizedBox.h16,
          registerButton(context),
          MySizedBox.h20,
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return AppButton(
      onTap: () {
        context.read<LoginCubit>().login(context);
      },
      text: MyText.log_in,
      loading:
          (context.watch<LoginCubit>().state is LoginInProgress) ? true : false,
    );
  }

  AppButton registerButton(BuildContext context) {
    return AppButton(
      color: MyColors.greyWhite,
      textColor: MyColors.black,
      // borderColor: MyColors.mainColor,
      onTap: () {
        //context.read<RegisterCubit>().register(context);
        Go.to(context, Pager.register);
      },
      text: MyText.registration,
    );
  }
}
