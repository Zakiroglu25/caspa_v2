import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailFieldForgot extends StatelessWidget {
  final emailController;

  EmailFieldForgot(this.emailController); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).emailStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: "email",
          maxLines: 1,
          hint: 'email',
          upperCase: false,
          textInputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: emailController,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateEmail(value),
        );
      },
    );
  }
}