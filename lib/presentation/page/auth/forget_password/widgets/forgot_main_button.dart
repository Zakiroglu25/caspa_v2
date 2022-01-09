import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_state.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotMainButton extends StatelessWidget {
  const ForgotMainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: CaspaButton(
        text: forgotCubit.buttonText,
        loading: (forgotCubit.state is ForgotPassInProgress),
        onTap: () {
          context.read<ForgotPassCubit>().changeState(context: context);
        },
      ),
    );
  }
}
