import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardIdFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  CardIdFieldRegister({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).idNumberStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.card_serie_and_id,
          maxLines: 1,
          hint: MyText.card_serie_and_id,
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
