import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: CaspaButton(
        isButtonActive:  context.watch<RegisterCubit>().isUserInfoValid(),
        text: 'Qeydiyyat'
      ),
    )
;
  }
}
