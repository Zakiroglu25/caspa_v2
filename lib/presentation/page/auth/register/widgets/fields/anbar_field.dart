import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnbarFieldRegister extends StatelessWidget {
  final TextEditingController ?controller;

  AnbarFieldRegister({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).anbarStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: "warehouse",
          maxLines: 1,
          hint: 'warehouse',
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateAnbar(value),
        );
      },
    );
  }
}
