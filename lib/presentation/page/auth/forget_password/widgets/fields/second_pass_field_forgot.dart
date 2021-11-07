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

class SecondPassFieldForgot extends StatefulWidget {
  final codeController;

  SecondPassFieldForgot(this.codeController);

  @override
  State<SecondPassFieldForgot> createState() => _SecondPassFieldForgotState();
}

class _SecondPassFieldForgotState extends State<SecondPassFieldForgot> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).passSecondStream,
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
          controller: widget.codeController,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateSecondPass(value),
        );
      },
    );
  }
}
