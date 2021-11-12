import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeFieldForgot extends StatelessWidget {
  final passController;

  CodeFieldForgot(this.passController); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).codeStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.password,
          maxLines: 1,
          hint: MyText.password,
          upperCase: false,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          controller: passController,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateCode(value),
        );
      },
    );
  }
}
