import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/enums/register_type.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  RegisterType registerType;

  RegisterButton({required this.registerType});

  @override
  Widget build(BuildContext context) {
    final astaate = context.watch<RegisterCubit>();
    bbbb("state: ${astaate.state}");
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: CaspaButton(
        isButtonActive: context
            .watch<RegisterCubit>()
            .isUserInfoValid(registerType: registerType),
        loading: (context.watch<RegisterCubit>().state is RegisterLoading),
        text: MyText.registration,
        onTap: () => context.read<RegisterCubit>().register(context),
      ),
    );
  }
}
