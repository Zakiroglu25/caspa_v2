import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/icons/invisible_icon.dart';
import 'package:caspa_v2/widget/icons/visible_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPassFieldForgot extends StatefulWidget {
  final controller;

  MainPassFieldForgot({this.controller});

  @override
  State<MainPassFieldForgot> createState() => _MainPassFieldForgotState();
}

class _MainPassFieldForgotState extends State<MainPassFieldForgot> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).passMainStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.new_pass,
          maxLines: 1,
          hint: MyText.enter_new_pass,
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
          upperCase: false,
          obscure: obscure,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          controller: widget.controller,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateMainPass(value),
        );
      },
    );
  }
}
