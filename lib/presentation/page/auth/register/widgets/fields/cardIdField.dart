import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardIdFieldRegister extends StatelessWidget {
  final TextEditingController ?controller;

  CardIdFieldRegister({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).idNumberStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: "card_id",
          maxLines: 1,
          hint: 'card_id',
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.characters,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateIdNumber(value),
        );
      },
    );
  }
}