import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/widget/icons/invisible_icon.dart';
import 'package:caspa_v2/widget/icons/visible_icon.dart';
import 'package:flutter/material.dart';

//class SecondPassFieldForgot extends StatelessWidget {

import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPassFieldRegister extends StatefulWidget {
  final controller;

  SecondPassFieldRegister({this.controller});

  @override
  State<SecondPassFieldRegister> createState() => _SecondPassFieldRegisterState();
}

class _SecondPassFieldRegisterState extends State<SecondPassFieldRegister> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).passSecondStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.password,
          maxLines: 1,
          hint: MyText.enter_new_pass_again,
          upperCase: false,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          obscure: obscure,
          suffixIcon: Material(
            color: Colors.transparent,
            child: GestureDetector(
              child: obscure ? VisibleIcon() : InvisibleIcon(),
              onTap: () {
                setState(() {
                  obscure = !obscure;
                });
              },
            ),
          ),
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          //controller: widget.controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateSecondPass(value),
        );
      },
    );
  }
}
