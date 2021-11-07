import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeFieldForgot extends StatelessWidget {
  final codeController;

  CodeFieldForgot(this.codeController); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).codeStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.code,
          maxLines: 1,
          hint: MyText.code,
          upperCase: false,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          controller: codeController,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateCode(value),
        );
      },
    );
  }
}
