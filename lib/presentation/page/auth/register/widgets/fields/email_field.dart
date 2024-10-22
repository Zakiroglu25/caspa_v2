import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  EmailFieldRegister({this.controller}); //=//= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).emailStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.email,
          maxLines: 1,
          hint: MyText.email,
          upperCase: false,
          textInputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateEmail(value),
        );
      },
    );
  }
}
